-- Tabla para Dueños
CREATE TABLE dueños (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla para Servicios
CREATE TABLE servicios (
    id INT PRIMARY KEY IDENTITY(1,1), -- Cambiado de AUTO_INCREMENT a IDENTITY(1,1)
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10, 2) NOT NULL
);

-- Tabla para Mascotas
CREATE TABLE mascotas (
    id INT PRIMARY KEY IDENTITY(1,1), -- Cambiado de AUTO_INCREMENT a IDENTITY(1,1)
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    edad INT,
    sexo VARCHAR(10),
    vacunada BIT, -- Cambiado de BOOLEAN a BIT
    cedula_dueño VARCHAR(20) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(), -- Cambiado de TIMESTAMP a DATETIME y CURRENT_TIMESTAMP a GETDATE()
    FOREIGN KEY (cedula_dueño) REFERENCES dueños(cedula)
);

-- Tabla para Visitas
CREATE TABLE visitas (
    id INT PRIMARY KEY IDENTITY(1,1), -- Cambiado de AUTO_INCREMENT a IDENTITY(1,1)
    mascota_id INT NOT NULL,
    servicio_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES mascotas(id),
    FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

-- Tabla para Tratamientos
CREATE TABLE tratamientos (
    id INT PRIMARY KEY IDENTITY(1,1), -- Cambiado de AUTO_INCREMENT a IDENTITY(1,1)
    visita_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (visita_id) REFERENCES visitas(id)
);
