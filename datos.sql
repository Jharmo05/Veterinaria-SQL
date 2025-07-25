-- Archivo DML para la Base de Datos "Veterinaria Mi Mejor Amigo"

-- Insertar 5 Dueños
INSERT INTO dueños (cedula, nombre_completo, telefono, direccion) VALUES
('1001', 'Juan Pérez García', '3001234567', 'Calle 10 # 20-30, Bogotá'),
('1002', 'María López Rodríguez', '3109876543', 'Carrera 5 # 15-25, Medellín'),
('1003', 'Carlos Sánchez Díaz', '3205551234', 'Avenida 8 # 3-10, Cali'),
('1004', 'Ana Gómez Martínez', '3017778899', 'Diagonal 25 # 12-45, Barranquilla'),
('1005', 'Pedro Ramírez Vargas', '3152223344', 'Transversal 1 # 5-50, Cartagena');

-- Insertar 5 Servicios
INSERT INTO servicios (nombre, descripcion, precio_base) VALUES
('Baño y Peluquería', 'Servicio completo de baño, secado y corte de pelo para mascotas.', 35.00),
('Consulta Médica General', 'Revisión general de la salud de la mascota y diagnóstico.', 40.00),
('Vacunación', 'Aplicación de vacunas esenciales según el plan de salud de la mascota.', 50.00),
('Desparasitación', 'Administración de medicamentos para eliminar parásitos internos y externos.', 25.00),
('Corte de Uñas', 'Servicio de corte y limado de uñas para mantener la higiene de las patas.', 10.00);

-- Insertar 10 Mascotas
INSERT INTO mascotas (nombre, especie, raza, edad, sexo, vacunada, cedula_dueño) VALUES
('Max', 'Perro', 'Labrador Retriever', 3, 'Macho', TRUE, '1001'),
('Luna', 'Gato', 'Siamés', 2, 'Hembra', TRUE, '1002'),
('Rocky', 'Perro', 'Pastor Alemán', 5, 'Macho', TRUE, '1001'),
('Mia', 'Gato', 'Persa', 1, 'Hembra', FALSE, '1003'),
('Toby', 'Perro', 'Poodle', 4, 'Macho', TRUE, '1004'),
('Cleo', 'Gato', 'Maine Coon', 3, 'Hembra', TRUE, '1005'),
('Buddy', 'Perro', 'Golden Retriever', 2, 'Macho', TRUE, '1002'),
('Simba', 'Gato', 'Bengala', 1, 'Macho', FALSE, '1001'),
('Bella', 'Perro', 'Bulldog Francés', 6, 'Hembra', TRUE, '1003'),
('Coco', 'Perro', 'Chihuahua', 2, 'Hembra', TRUE, '1004');

-- Insertar 10 Visitas
INSERT INTO visitas (mascota_id, servicio_id, fecha) VALUES
(1, 2, '2024-01-15'), -- Max - Consulta Médica General
(2, 1, '2024-01-20'), -- Luna - Baño y Peluquería
(3, 3, '2024-02-01'), -- Rocky - Vacunación
(4, 5, '2024-02-10'), -- Mia - Corte de Uñas
(5, 2, '2024-02-15'), -- Toby - Consulta Médica General
(1, 4, '2024-03-01'), -- Max - Desparasitación
(6, 1, '2024-03-05'), -- Cleo - Baño y Peluquería
(7, 2, '2024-03-10'), -- Buddy - Consulta Médica General
(8, 5, '2024-03-15'), -- Simba - Corte de Uñas
(9, 3, '2024-03-20'); -- Bella - Vacunación

-- Insertar 5 Tratamientos
INSERT INTO tratamientos (visita_id, nombre, observaciones) VALUES
(1, 'Antibióticos para infección', 'Administrar 1 pastilla cada 12 horas por 7 días para tratar la infección.'),
(5, 'Analgésicos para dolor', 'Administrar 0.5 ml cada 8 horas por 3 días para aliviar el dolor.'),
(8, 'Suplemento de Vitaminas', 'Administrar suplemento vitamínico diario para mejorar la salud general.'),
(1, 'Dieta especial hipoalergénica', 'Cambiar a alimento hipoalergénico para mascotas con sensibilidades alimentarias.'),
(3, 'Revisión post-vacunación', 'Programar control en una semana para verificar la reacción a la vacuna.');
