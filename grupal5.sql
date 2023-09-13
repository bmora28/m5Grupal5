-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
    género ENUM('Masculino', 'Femenino', 'Otro'),
    telefono_contacto VARCHAR(15)
);

-- Crear la tabla de ingresos de usuarios
CREATE TABLE ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
-- Modificar la zona horaria predeterminada en la tabla de usuarios a UTC-2
ALTER TABLE usuarios
MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2';

CREATE TABLE Contactos (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    numero_telefono VARCHAR(15),
    correo_electronico VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
-- Insertar 8 registros en la tabla de usuarios
INSERT INTO usuarios (nombre, apellido, contraseña, género, telefono_contacto)
VALUES
    ('Juan', 'Pérez', 'contraseña1', 'Masculino', '1234567890'),
    ('María', 'Gómez', 'contraseña2', 'Femenino', '9876543210'),
    ('Carlos', 'Rodríguez', 'contraseña3', 'Masculino', '5555555555'),
    ('Ana', 'López', 'contraseña4', 'Femenino', '1111111111'),
    ('Pedro', 'Martínez', 'contraseña5', 'Masculino', '9999999999'),
    ('Laura', 'Sánchez', 'contraseña6', 'Femenino', '7777777777'),
    ('Luis', 'Fernández', 'contraseña7', 'Masculino', '8888888888'),
    ('Elena', 'García', 'contraseña8', 'Femenino', '6666666666');
-- Insertar 8 registros en la tabla de ingresos relacionados con los usuarios
INSERT INTO ingresos (id_usuario)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8);
-- Agregar una columna "id_contacto" a la tabla de Usuarios como clave foránea
ALTER TABLE usuarios
ADD COLUMN id_contacto INT;

-- Crear una clave foránea para la nueva columna
ALTER TABLE usuarios
ADD FOREIGN KEY (id_contacto) REFERENCES Contactos(id_contacto);
