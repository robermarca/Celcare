USE proyecto_hospital;

-- =====================
-- AREAS
-- =====================
INSERT INTO areas (nombre, planta) VALUES
('1A', 'Primera'),
('1B', 'Primera'),
('2A', 'Segunda'),
('2B', 'Segunda');

-- =====================
-- USUARIOS
-- =====================
INSERT INTO usuarios (nombre, apellidos, email, password_hash, id_area) VALUES
('Sergio', 'Gallardo', 'sergio@celcare.com', '1234', 1),
('Laura', 'Martínez', 'laura@celcare.com', '1234', 2);

-- =====================
-- PACIENTES
-- =====================
INSERT INTO pacientes (nombre, apellidos, habitacion, planta_habitacion) VALUES
('Juan', 'Pérez', '101', 'Primera'),
('Carmen', 'Ruiz', '201', 'Segunda');

-- =====================
-- UBICACIONES
-- =====================

-- Camas
INSERT INTO ubicaciones (nombre, tipo, planta, zona, habitacion) VALUES
('Cama 101.1', 'cama', 'Primera', '1A', '101'),
('Cama 101.2', 'cama', 'Primera', '1A', '101'),
('Cama 201.1', 'cama', 'Segunda', '2A', '201'),
('Cama 201.2', 'cama', 'Segunda', '2A', '201');

-- Servicios
INSERT INTO ubicaciones (nombre, tipo, planta, zona) VALUES
('Radiología', 'servicio', 'Primera', '1B'),
('Cardiología', 'servicio', 'Segunda', '2A'),
('Oncología', 'servicio', 'Segunda', '2B');

-- =====================
-- TRASLADOS
-- =====================

-- Juan: cama → radiología
INSERT INTO traslados (id_paciente, id_origen, id_destino, id_usuario, estado)
VALUES (1, 1, 5, 1, 'pendiente');

-- Carmen: cama → oncología
INSERT INTO traslados (id_paciente, id_origen, id_destino, id_usuario, estado)
VALUES (2, 3, 7, 2, 'en_curso');

-- Carmen: oncología → cardiología (encadenado)
INSERT INTO traslados (id_paciente, id_origen, id_destino, id_usuario, estado)
VALUES (2, 7, 6, 2, 'pendiente');

-- =====================
-- HISTORIAL
-- =====================

INSERT INTO historial_traslados (id_traslado, estado, comentario) VALUES
(1, 'pendiente', 'Traslado solicitado a Radiología'),

(2, 'pendiente', 'Paciente programada para Oncología'),
(2, 'en_curso', 'Paciente ya en traslado'),

(3, 'pendiente', 'Traslado posterior a Cardiología');