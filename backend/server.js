const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const server = express();

server.use(cors());
server.use(express.json());

const PORT = 3000;

const pool_mysql = mysql.createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "standapi",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

function iniciarServidor() {
  pool_mysql.getConnection((error, connection) => {
    if (error) {
      console.error("Error conectando a MySQL: ", error);
      process.exit(1);
    }
    connection.release();

    server.listen(PORT, () => {
      console.log("Conectado a MySQL");
      console.log(`URL: http://localhost:${PORT}`);
    });
  });
}

iniciarServidor();

server.get("/stand", (req, res) => {
  const nombre = req.query.nombre;
  const evo = req.query.id_evolucion;
  let valores = [];
  let sql = "SELECT * FROM stand";

  if (nombre) {
    sql += " WHERE nombre = ?";
    valores.push(nombre);
  }

  pool_mysql.query(sql, valores, (error, resultados) => {
    if (error) {
      console.error("Error en la consulta: ", error);
      return res.status(500).json({ error });
    }

    res.json(resultados);
  });
});

server.get("/portador", (req, res) => {
  const nombre = req.query.nombre;
  let valores = [];
  let sql = "SELECT * FROM portador";

  if (nombre) {
    sql += " WHERE nombre = ?";
    valores.push(nombre);
  }

  pool_mysql.query(sql, valores, (error, resultados) => {
    if (error) {
      console.error("Error en la consulta: ", error);
      return res.status(500).json({ error });
    }

    res.json(resultados);
  });
});

server.post("/stand", (req, res) => {
  const { id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial, id_portador, referencia_musical } = req.body;

  const sql = `
    INSERT INTO stand (id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial, referencia_musical)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  pool_mysql.query(
    sql,
    [id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial, referencia_musical],
    (error, resultados) => {
      if (error) {
        console.error("Error en INSERT:", error);
        return res.status(500).json({ error });
      }

      const idStandInsertado = resultados.insertId;

      if (id_portador) {
        const sqlPortador = "INSERT INTO stand_portador (id_stand, id_portador) VALUES (?, ?)";
        pool_mysql.query(sqlPortador, [idStandInsertado, id_portador], (errPortador) => {
          if (errPortador) {
            console.error("Error al vincular portador:", errPortador);
          }
          res.json({
            mensaje: "Stand y Portador insertados correctamente",
            datos: { id: idStandInsertado, nombre, id_portador }
          });
        });
      } else {
        res.json({
          mensaje: "Stand insertado correctamente",
          datos: { id: idStandInsertado, nombre }
        });
      }
    }
  );
});

server.get("/buscar/stand", (req, res) => {
  const texto = req.query.q;

  if (!texto) {
    return res.status(400).json({ error: "Falta el texto de búsqueda" });
  }

  const sql = `
    SELECT *
    FROM stand
    WHERE nombre LIKE ?`;

  pool_mysql.query(sql, [`%${texto}%`], (error, resultados) => {
    if (error) {
      console.error("Error en la búsqueda: ", error);
      return res.status(500).json({ error });
    }
    res.json(resultados);
  });
});

server.get("/buscar/portador", (req, res) => {
  const texto = req.query.q;

  if (!texto) {
    return res.status(400).json({ error: "Falta el texto de búsqueda" });
  }

  const sql = `
    SELECT *
    FROM portador
    WHERE nombre LIKE ?`;

  pool_mysql.query(sql, [`%${texto}%`], (error, resultados) => {
    if (error) {
      console.error("Error en la búsqueda de portador: ", error);
      return res.status(500).json({ error });
    }
    res.json(resultados);
  });
});

// ENDPOINT PA BORRAR TEMPORAL
server.delete("/stand/:id", (req, res) => {
  const id = req.params.id;

  // primero borramos la relación en la tabla intermedia
  const sqlRelacion = "DELETE FROM stand_portador WHERE id_stand = ?";

  pool_mysql.query(sqlRelacion, [id], (errorRelacion) => {
    if (errorRelacion) {
      console.error("Error al borrar la relación stand-portador:", errorRelacion);
      return res.status(500).json({ error: errorRelacion });
    }

    // una vez borrada la relación (o si no existía), borramos el stand
    const sqlStand = "DELETE FROM stand WHERE id = ?";
    pool_mysql.query(sqlStand, [id], (error) => {
      if (error) {
        console.error("Error en DELETE:", error);
        return res.status(500).json({ error });
      }

      res.json({ mensaje: "Stand eliminado correctamente" });
    });
  });
});

server.get("/stand/portador/evolucion", (req, res) => {

  const sql = `
    SELECT
      s.*,

      evo.id AS id_evolucion_real,
      evo.nombre AS evolucion,

      (
        SELECT GROUP_CONCAT(CONCAT(p.id, ':', p.nombre) SEPARATOR ', ')
        FROM stand_portador sp
        JOIN portador p
          ON sp.id_portador = p.id
        WHERE sp.id_stand = s.id
      ) AS portadores

    FROM stand s

    LEFT JOIN stand evo
      ON s.id_evolucion = evo.id
  `;

  pool_mysql.query(sql, (error, resultados) => {

    if (error) {
      console.error("Error en la consulta: ", error);
      return res.status(500).json({ error });
    }

    res.json(resultados);

  });

});

// TEST
