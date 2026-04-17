CREATE DATABASE standapi;
USE standapi;

CREATE TABLE Stand (
    id INT AUTO_INCREMENT,
	id_evolucion INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    aparicion VARCHAR(100),
    imagen_manga VARCHAR (100),
    imagen_anime VARCHAR (100),
    poder CHAR(1), -- A, B, C, D, E, 8
    velocidad CHAR(1),
    alcance CHAR(1),
    durabilidad CHAR(1),
    precis CHAR(1),
    potencial CHAR(1),
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT fk_stand_evolucion FOREIGN KEY (id_evolucion) REFERENCES Stand(id)
) ENGINE=INNODB;


CREATE TABLE Portador (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    aparicion VARCHAR(100),
    imagen_manga VARCHAR(100),
    imagen_anime VARCHAR(100),
	CONSTRAINT PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE Stand_Portador (
    id_stand INT,
    id_portador INT,
    CONSTRAINT PRIMARY KEY (id_stand, id_portador),
    FOREIGN KEY (id_stand) REFERENCES Stand(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (id_portador) REFERENCES Portador(id)
        ON UPDATE CASCADE
) ENGINE=INNODB;

INSERT INTO Stand (nombre, descripcion, aparicion, poder, velocidad, alcance, durabilidad, precis, potencial) 
VALUES 
('Star Platinum', 'Star Platinum es un Stand de corto alcance, con un alcance básico de solo 2 metros del cuerpo de Jotaro, pero con una fuerza, velocidad y precisión increíbles. Es uno de los Stands más poderosos de la serie.', 'Parte 3', 'A', 'A', 'C', 'A', 'A', 'A'),
('Magician\'s Red', 'Magician\'s Red es un Stand humanoide de rango-medio; su capacidad única es la generación y manipulación del fuego.', 'Parte 3', 'B', 'B', 'C', 'B', 'C', 'D'),
('Hermit Purple', 'Las habilidades físicas de Hermit Purple son relativamente débiles, pero proporcionan a Joseph con una considerable habilidad de adivinación, permitiéndole divinizar y materializar cualquier tipo de información como una imagen, un lugar o incluso pensamientos.', 'Parte 3 y Parte 4', 'D', 'C', 'D', 'A', 'D', 'E'),
('Hierophant Green', 'Hierophant Green es un Stand elástico y remoto, capaz de "explorar" el terreno y realizar acciones desde una gran distancia. Kakyoin ha poseído este Stand desde su nacimiento.', 'Parte 3', 'C', 'B', 'A', 'B', 'C', 'D');

