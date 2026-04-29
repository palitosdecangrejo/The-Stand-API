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
  const { id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial } = req.body;

  const sql = `
    INSERT INTO stand (id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  pool_mysql.query(
    sql,
    [id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial],
    (error, resultado) => {
      if (error) {
        console.error("Error en INSERT:", error);
        return res.status(500).json({ error });
      }

      res.json({
        mensaje: "Stand insertado correctamente",
        datos: { id_evolucion, nombre, descripcion, aparicion, imagen_manga, imagen_anime, poder, velocidad, alcance, durabilidad, precis, potencial }
      });
    }
  );
});

// TEST
