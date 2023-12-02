-- Inserção de pacientes na tabela 'pacientes'
INSERT INTO pacientes (Codigo, CPF, Nome, Sexo , Data_de_nascimento, Telefone, Logradouro, Endereço, Complemento)
VALUES
  (1, 12345678901,'F', 'Maria Silva', '1990-03-12', 987654321, 'Rua Flores', 'Bairro Alegre', 'Apto 301'),
  (2, 23456789012,'M' ,'João Oliveira', '1985-08-25', 987123456, 'Av. Principal', 'Centro', 'Sala 102'),
  (3, 34567890123,'M' ,'Carlos Santos', '1978-05-18', 789012345, 'Rua das Árvores', 'Jardim Feliz', 'Casa 15'),
  (4, 45678901234,'F' ,'Amanda Souza', '1995-11-30', 876543210, 'Alameda dos Lagos', 'Condomínio Sereno', 'Lote 5'),
  (5, 56789012345,'M' ,'Rodrigo Lima', '1980-02-09', 765432109, 'Travessa da Paz', 'Vila Harmonia', 'Bloco B'),
  (6, 67890123456,'F' ,'Fernanda Costa', '1992-07-22', 654321098, 'Rua das Montanhas', 'Bairro Tranquilo', 'Casa 7'),
  (7, 78901234567,'M' ,'Paulo Mendes', '1987-04-05', 543210987, 'Avenida do Sol', 'Cidade Radiante', 'Apto 505'),
  (8, 89012345678,'F' ,'Laura Oliveira', '1983-09-15', 432109876, 'Alameda das Flores', 'Jardim Encantado', 'Casa 12'),
  (9, 90123456789,'M' ,'Lucas Pereira', '1998-01-28', 321098765, 'Rua do Bosque', 'Parque Verde', 'Apto 201'),
  (10, 12345678909,'F' ,'Bianca Martins', '1989-06-10', 210987654, 'Praça Central', 'Centro Histórico', 'Loja 3');

-- Inserção de convênios na tabela 'convenios'
INSERT INTO convenios (Codigo, Descricao)
VALUES
  (1, 'Plano Saúde A'),
  (2, 'Seguro Saúde B'),
  (3, 'Assistência Médica C'),
  (4, 'Particular D'), --Baseado nos requisitos do trabalho, massa de dados alterada para Particulas
  (5, 'Seguro de Vida E'),
  (6, 'Plano Familiar F'),
  (7, 'Convênio Empresarial G'),
  (8, 'Plano Senior H'),
  (9, 'Seguro Viagem I'),
  (10, 'Plano Estudantil J');

-- Inserção de médicos na tabela 'medicos'
INSERT INTO medicos (Codigo, Nome)
VALUES
  (1, 'Dr. Ana Oliveira'),
  (2, 'Dr. Pedro Mendonça'),
  (3, 'Dra. Luana Santos'),
  (4, 'Dr. Ricardo Pereira'),
  (5, 'Dra. Marina Lima'),
  (6, 'Dr. André Costa'),
  (7, 'Dra. Lucas Oliveira'),
  (8, 'Dr. Gabriela Martins'),
  (9, 'Dra. João Silva'),
  (10, 'Dr. Carolina Pereira');

-- Inserção de especialidades na tabela 'especialidades'
INSERT INTO especialidades (Codigo, Descricao)
VALUES
  (1, 'Cardiologia'),
  (2, 'Pediatria'),
  (3, 'Ginecologia'),
  (4, 'Ortopedia'),
  (5, 'Dermatologia'),
  (6, 'Neurologia'),
  (7, 'Oftalmologia'),
  (8, 'Urologia'),
  (9, 'Oncologia'),
  (10, 'Endocrinologia');

-- Inserção de tipos de exame na tabela 'tipo_exame'
INSERT INTO tipo_exame (Codigo, Descricao)
VALUES
  (1, 'Hemograma'),
  (2, 'Radiografia'),
  (3, 'Ressonância Magnética'),
  (4, 'Ultrassonografia'),
  (5, 'Eletrocardiograma'),
  (6, 'Colonoscopia'),
  (7, 'Tomografia Computadorizada'),
  (8, 'Ecocardiograma'),
  (9, 'Exame de Sangue'),
  (10, 'Mamografia');

-- Inserção de dados na tabela 'paciente_conveniado'
INSERT INTO paciente_conveniado (Codigo_paciente, Codigo_convenio)
VALUES
  (1, 2),
  (2, 4),
  (3, 3),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 9),
  (8, 1),
  (9, 10),
  (10, 8);

-- Inserção de dados na tabela 'especialista'
INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
VALUES
  (1, 3),
  (2, 4),
  (3, 6),
  (4, 5),
  (5, 2),
  (6, 1),
  (7, 10),
  (8, 7),
  (9, 8),
  (10,9);

-- Inserção de dados na tabela 'especialista_conveniado'
INSERT INTO especialista_conveniado (Codigo_convenio, Codigo_medico, Codigo_especialidade, Valor)
VALUES
  (1, 1, 3, 150.00),
  (2, 2, 4, 180.00),
  (3, 3, 6, 200.00),
  (4, 4, 5, 160.00),
  (5, 5, 2, 190.00),
  (6, 6, 1, 170.00),
  (7, 7, 10, 210.00),
  (8, 8, 7, 220.00),
  (9, 9, 8, 240.00),
  (10,10,9, 230.00);

-- Inserção de dados na tabela 'consulta'
INSERT INTO consulta (Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_hora)
VALUES
  (1, 1, 1, 3, '2023-01-15 09:00:00'),
  (2, 2, 2, 4, '2023-02-20 10:30:00'),
  (3, 3, 3, 6, '2023-03-03 14:45:00'),
  (4, 4, 4, 5, '2023-04-12 08:15:00'),
  (5, 5, 5, 2, '2023-05-25 11:30:00'),
  (6, 6, 6, 1, '2023-06-18 13:45:00'),
  (7, 7, 7, 10, '2023-07-09 15:00:00'),
  (8, 8, 8, 7, '2023-08-30 16:30:00'),
  (9, 9, 9, 8, '2023-09-22 18:45:00'),
  (10, 10,10,9, '2023-10-07 20:00:00'),
  (1, 2, 2, 4, '2023-11-15 09:30:00'),
  (2, 3, 3, 6, '2023-12-20 10:45:00'),
  (3, 1, 1, 3, '2024-01-03 14:00:00'),
  (4, 5, 5, 2, '2024-02-12 08:45:00'),
  (5, 4, 4, 5, '2024-03-25 11:15:00'),
  (6, 7, 7, 10, '2024-04-18 13:30:00'),
  (7, 6, 6, 1, '2024-05-09 15:45:00'),
  (8, 9, 9, 8, '2024-06-30 16:00:00'),
  (9, 10,10,9, '2024-07-22 18:15:00'),
  (10, 8, 8, 7, '2024-08-07 19:30:00');

-- Inserção de dados na tabela 'quartos'
INSERT INTO quartos (Codigo)
VALUES
  (101),
  (102),
  (103),
  (104),
  (105),
  (106),
  (107),
  (108),
  (109),
  (110);

-- Inserção de dados na tabela 'internacoes'
INSERT INTO internacoes (Codigo, Data_entrada, Data_Saida, Valor, Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta, Codigo_quarto)
VALUES
  (1, '2023-01-15 10:00:00', '2023-01-18 12:00:00', 1500.00, 1, 1, , 1, 3, '2023-01-15 09:00:00', 101),
  (2, '2023-02-20 11:30:00', '2023-02-25 14:00:00', 1800.00, 2, 2, , 2, 4, '2023-02-20 10:30:00', 102),
  (3, '2023-03-03 15:45:00', '2023-03-08 17:30:00', 2000.00, 3, 3, , 3, 6, '2023-03-03 14:45:00', 103),
  (4, '2023-04-12 09:15:00', '2023-04-16 11:00:00', 1600.00, 1, 2, , 4, 5, '2023-04-12 08:15:00', 104),
  (5, '2023-05-25 12:30:00', '2023-05-28 14:45:00', 1900.00, 2, 3, , 5, 2, '2023-05-25 11:30:00', 105),
  (6, '2023-06-18 14:45:00', '2023-06-22 16:30:00', 1700.00, 3, 1, , 6, 1, '2023-06-18 13:45:00', 106),
  (7, '2023-07-09 16:00:00', '2023-07-14 18:15:00', 2100.00, 4, 5, , 7, 1, '2023-07-09 15:00:00', 107),
  (8, '2023-08-30 17:30:00', '2023-09-03 19:00:00', 2200.00, 7, 6, , 8, 7, '2023-08-30 16:30:00', 108),
  (9, '2023-09-22 19:45:00', '2023-09-27 21:30:00', 2400.00, 8, 9, , 9, 8, '2023-09-22 18:45:00', 109),
  (10, '2023-10-07 21:00:00', '2023-10-12 23:15:00', 2300.00, 9, 10, 10,9,  '2023-10-07 20:00:00', 110);

-- Inserção de medicamentos na tabela 'medicamentos'
INSERT INTO medicamentos (Codigo, Descricao)
VALUES
  (1, 'Paracetamol'),
  (2, 'Ibuprofeno'),
  (3, 'Amoxicilina'),
  (4, 'Omeprazol'),
  (5, 'Atorvastatina'),
  (6, 'Metformina'),
  (7, 'Hidroclorotiazida'),
  (8, 'Lisinopril'),
  (9, 'Levotiroxina'),
  (10, 'Losartana');

-- Inserção de dados na tabela 'receita_consulta'
INSERT INTO receita_consulta (Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta, Codigo_medicamento)
VALUES
  (1, 1, 1, 3,  '2023-01-15 09:00:00', 1),
  (2, 2, 2, 4,  '2023-02-20 10:30:00', 2),
  (3, 3, 3, 6,  '2023-03-03 14:45:00', 3),
  (4, 4, 4, 5,  '2023-04-12 08:15:00', 4),
  (5, 5, 5, 2,  '2023-05-25 11:30:00', 5),
  (6, 6, 6, 1,  '2023-06-18 13:45:00', 6),
  (7, 7, 7, 10, '2023-07-09 15:00:00', 7),
  (8, 8, 8, 7,  '2023-08-30 16:30:00', 8),
  (9, 9, 9, 8,  '2023-09-22 18:45:00', 9),
  (10,10,10,9,  '2023-10-07 20:00:00', 10);

-- Inserção de dados na tabela 'receita_internacao'
INSERT INTO receita_internacao (Codigo_internacao, Codigo_medicamento, Data_hora)
VALUES
  (1, 1, '2023-01-15 10:00:00'),
  (2, 2, '2023-02-20 11:30:00'),
  (3, 3, '2023-03-03 15:45:00'),
  (4, 4, '2023-04-12 09:15:00'),
  (5, 5, '2023-05-25 12:30:00'),
  (6, 6, '2023-06-18 14:45:00'),
  (7, 7, '2023-07-09 16:00:00'),
  (8, 8, '2023-08-30 17:30:00'),
  (9, 9, '2023-09-22 19:45:00'),
  (10, 10, '2023-10-07 21:00:00');

-- Inserção de dados na tabela 'exame_consulta'
INSERT INTO exame_consulta (Codigo, Data_hora, Valor, Resultado, Codigo_tipo_exame, Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta)
VALUES
  (1, '2023-01-15 09:30:00', 200.00, 'Normal',  1, 1, 1, 1, 3, '2023-01-15 09:00:00'),
  (2, '2023-02-20 10:45:00', 180.00, 'Negativo',2, 2, 2, 2, 4, '2023-02-20 10:30:00'),
  (3, '2023-03-03 14:00:00', 150.00, 'Normal',  3, 3, 3, 3, 6, '2023-03-03 14:45:00'),
  (4, '2023-04-12 08:45:00', 210.00, 'Positivo',4, 4, 4, 4, 5, '2023-04-12 08:15:00'),
  (5, '2023-05-25 11:15:00', 190.00, 'Normal',  5, 5, 5, 5, 2, '2023-05-25 11:30:00'),
  (6, '2023-06-18 13:30:00', 170.00, 'Negativo',6, 6, 6, 6, 1, '2023-06-18 13:45:00'),
  (7, '2023-07-09 15:45:00', 220.00, 'Positivo',7, 7, 7, 7, 10,'2023-07-09 15:00:00'),
  (8, '2023-08-30 16:00:00', 200.00, 'Normal',  8, 8, 8, 8, 7, '2023-08-30 16:30:00'),
  (9, '2023-09-22 18:15:00', 180.00, 'Negativo',9, 9, 9, 9, 8, '2023-09-22 18:45:00'),
  (10, '2023-10-07 19:30:00', 250.00,'Positivo',10, 10,10,10,9, '2023-10-07 20:00:00'),
  (11, '2023-11-15 10:00:00', 230.00, 'Normal', 1, 1, 2, 2, 4, '2023-11-15 09:30:00'),
  (12, '2023-12-20 11:15:00', 210.00,'Negativo',1, 2, 3, 3, 6, '2023-12-20 10:45:00'),
  (13, '2024-01-03 14:30:00', 190.00, 'Normal', 3, 3, 4, 4, 5, '2024-01-03 14:00:00'),
  (14, '2024-02-12 09:45:00', 180.00,'Positivo',4, 4, 5, 5, 2,  '2024-02-12 08:45:00'),
  (15, '2024-03-25 12:00:00', 200.00, 'Normal', 5, 5, 6, 6, 1,  '2024-03-25 11:15:00'),
  (16, '2024-04-18 13:15:00', 220.00,'Negativo',6, 6, 7, 7, 10, '2024-04-18 13:30:00'),
  (17, '2024-05-09 15:30:00', 240.00,'Positivo',7, 7, 8, 8, 7,  '2024-05-09 15:45:00'),
  (18, '2024-06-30 16:45:00', 190.00, 'Normal', 8, 8, 9, 9, 8,  '2024-06-30 16:00:00'),
  (19, '2024-07-22 18:00:00', 210.00,'Negativo',9, 9, ,10,10,9, '2024-07-22 18:15:00'),
  (20, '2024-08-07 19:15:00', 180.00,'Positivo',10, 10, 10, 10, 10, '2024-08-07 19:30:00');

-- Inserção de dados na tabela 'exame_internacao'
INSERT INTO exame_internacao (Codigo, Data_hora, Valor, Resultado, Codigo_tipo_exame, Codigo_internacao)
VALUES
  (1, '2023-01-15 10:30:00', 250.00, 'Positivo', 1, 1),
  (2, '2023-02-20 12:00:00', 220.00, 'Normal', 2, 2),
  (3, '2023-03-03 16:15:00', 200.00, 'Negativo', 3, 3),
  (4, '2023-04-12 10:30:00', 180.00, 'Positivo', 4, 4),
  (5, '2023-05-25 13:45:00', 210.00, 'Normal', 5, 5),
  (6, '2023-06-18 15:00:00', 190.00, 'Negativo', 6, 6),
  (7, '2023-07-09 16:15:00', 180.00, 'Positivo', 7, 7),
  (8, '2023-08-30 17:30:00', 200.00, 'Normal', 8, 8),
  (9, '2023-09-22 19:45:00', 230.00, 'Negativo', 9, 9),
  (10, '2023-10-07 21:00:00', 240.00, 'Positivo', 10, 10);


