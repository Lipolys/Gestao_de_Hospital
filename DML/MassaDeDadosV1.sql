-- #####
-- * *****
-- * File: MassaDeDados1.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Tuesday, 28 November 2023 10:23:55
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Tuesday, 28 November 2023 10:28:39
-- * Modified By: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Copyright (c) 2023 All rights reserved, Marcos Antônio Barbosa de Souza
-- * -----
-- * Description:
-- * ············
-- * *****
-- #####
--
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name nome do script sql
-- @description descrição do script sql
-- Inserção de pacientes na tabela 'pacientes'
INSERT INTO pacientes (
    Codigo,
    CPF,
    Nome,
    Data_de_nascimento,
    Telefone,
    Logradouro,
    Endereço,
    Complemento
  )
VALUES (
    1,
    12345678901,
    'João Silva',
    '1990-01-15',
    1122334455,
    'Rua A',
    'Bairro A',
    'Apto 101'
  ),
  (
    2,
    98765432109,
    'Maria Oliveira',
    '1985-05-20',
    9988776655,
    'Rua B',
    'Bairro B',
    'Casa 202'
  ),
  (
    3,
    34567890123,
    'Carlos Santos',
    '1978-11-03',
    5544332211,
    'Rua C',
    'Bairro C',
    'Sala 303'
  ),
  (
    4,
    56789012345,
    'Ana Pereira',
    '1995-08-12',
    6677889900,
    'Rua D',
    'Bairro D',
    'Apto 404'
  ),
  (
    5,
    87654321098,
    'Pedro Oliveira',
    '1980-04-25',
    1122334455,
    'Rua E',
    'Bairro E',
    'Casa 505'
  ),
  (
    6,
    23456789012,
    'Marta Souza',
    '1992-07-18',
    9988776655,
    'Rua F',
    'Bairro F',
    'Apto 606'
  ),
  (
    7,
    45678901234,
    'Luiz Silva',
    '1987-02-09',
    5544332211,
    'Rua G',
    'Bairro G',
    'Casa 707'
  ),
  (
    8,
    67890123456,
    'Juliana Santos',
    '1983-09-30',
    6677889900,
    'Rua H',
    'Bairro H',
    'Sala 808'
  ),
  (
    9,
    78901234567,
    'Ricardo Pereira',
    '1975-12-22',
    1122334455,
    'Rua I',
    'Bairro I',
    'Apto 909'
  ),
  (
    10,
    12345098765,
    'Fernanda Oliveira',
    '1988-06-07',
    9988776655,
    'Rua J',
    'Bairro J',
    'Casa 1010'
  );
-- Inserção de convênios na tabela 'convenios'
INSERT INTO convenios (Codigo, Descricao)
VALUES (1, 'Plano de Saúde A'),
  (2, 'Plano de Saúde B'),
  (3, 'Plano de Saúde C'),
  (4, 'Plano de Saúde D'),
  (5, 'Plano de Saúde E'),
  (6, 'Plano de Saúde F'),
  (7, 'Plano de Saúde G'),
  (8, 'Plano de Saúde H'),
  (9, 'Plano de Saúde I'),
  (10, 'Plano de Saúde J');
-- Inserção de médicos na tabela 'medicos'
INSERT INTO medicos (Codigo, Nome)
VALUES (1, 'Dr. Silva'),
  (2, 'Dra. Oliveira'),
  (3, 'Dr. Santos'),
  (4, 'Dra. Pereira'),
  (5, 'Dr. Oliveira'),
  (6, 'Dra. Souza'),
  (7, 'Dr. Silva'),
  (8, 'Dra. Santos'),
  (9, 'Dr. Pereira'),
  (10, 'Dra. Oliveira');
-- Inserção de especialidades na tabela 'especialidades'
INSERT INTO especialidades (Codigo, Descricao)
VALUES (1, 'Cardiologia'),
  (2, 'Dermatologia'),
  (3, 'Ginecologia'),
  (4, 'Ortopedia'),
  (5, 'Pediatria'),
  (6, 'Psiquiatria'),
  (7, 'Oncologia'),
  (8, 'Neurologia'),
  (9, 'Urologia'),
  (10, 'Oftalmologia');
-- Inserção de tipos de exame na tabela 'tipo_exame'
INSERT INTO tipo_exame (Codigo, Descricao)
VALUES (1, 'Hemograma'),
  (2, 'Radiografia'),
  (3, 'Ressonância Magnética'),
  (4, 'Ultrassonografia'),
  (5, 'Eletrocardiograma'),
  (6, 'Colonoscopia'),
  (7, 'Endoscopia'),
  (8, 'Tomografia Computadorizada'),
  (9, 'Ecocardiograma'),
  (10, 'Exame de Sangue');
-- Inserção de pacientes conveniados na tabela 'paciente_conveniado'
INSERT INTO paciente_conveniado (Codigo_paciente, Codigo_convenio)
VALUES (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);
-- Inserção de especialistas na tabela 'especialista'
INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
VALUES (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);
-- Inserção de especialistas conveniados na tabela 'especialista_conveniado'
INSERT INTO especialista_conveniado (
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Valor
  )
VALUES (1, 1, 1, 150.00),
  (2, 2, 2, 180.00),
  (3, 3, 3, 200.00),
  (4, 4, 4, 160.00),
  (5, 5, 5, 175.00),
  (6, 6, 6, 190.00),
  (7, 7, 7, 170.00),
  (8, 8, 8, 185.00),
  (9, 9, 9, 195.00),
  (10, 10, 10, 210.00);
-- Inserção de consultas na tabela 'consulta'
INSERT INTO consulta (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_hora
  )
VALUES (1, 1, 1, 1, '2023-01-15 09:00:00'),
  (2, 2, 2, 2, '2023-02-20 10:30:00'),
  (3, 3, 3, 3, '2023-03-03 14:45:00'),
  (4, 4, 4, 4, '2023-04-12 08:15:00'),
  (5, 5, 5, 5, '2023-05-25 11:30:00'),
  (6, 6, 6, 6, '2023-06-18 13:45:00'),
  (7, 7, 7, 7, '2023-07-09 15:00:00'),
  (8, 8, 8, 8, '2023-08-30 16:30:00'),
  (9, 9, 9, 9, '2023-09-22 18:45:00'),
  (10, 10, 10, 10, '2023-10-07 20:00:00'),
  (1, 1, 1, 1, '2023-11-15 09:30:00'),
  (2, 2, 2, 2, '2023-12-20 10:45:00'),
  (3, 3, 3, 3, '2024-01-03 14:00:00'),
  (4, 4, 4, 4, '2024-02-12 08:45:00'),
  (5, 5, 5, 5, '2024-03-25 11:15:00'),
  (6, 6, 6, 6, '2024-04-18 13:30:00'),
  (7, 7, 7, 7, '2024-05-09 15:45:00'),
  (8, 8, 8, 8, '2024-06-30 16:00:00'),
  (9, 9, 9, 9, '2024-07-22 18:15:00'),
  (10, 10, 10, 10, '2024-08-07 19:30:00');
-- Inserção de quartos na tabela 'quartos'
INSERT INTO quartos (Codigo)
VALUES (101),
  (102),
  (103),
  (104),
  (105),
  (201),
  (202),
  (203),
  (204),
  (205);
-- Inserção de internações na tabela 'internacoes'
INSERT INTO internacoes (
    Codigo,
    Data_entrada,
    Data_Saida,
    Valor,
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta,
    Codigo_quarto
  )
VALUES (
    1,
    '2023-01-15 10:00:00',
    '2023-01-20 14:00:00',
    1500.00,
    1,
    1,
    1,
    1,
    '2023-01-15 09:00:00',
    101
  ),
  (
    2,
    '2023-02-20 11:30:00',
    '2023-02-25 16:30:00',
    1800.00,
    2,
    2,
    2,
    2,
    '2023-02-20 10:30:00',
    102
  ),
  (
    3,
    '2023-03-03 15:45:00',
    '2023-03-08 18:45:00',
    2000.00,
    3,
    3,
    3,
    3,
    '2023-03-03 14:45:00',
    103
  ),
  (
    4,
    '2023-04-12 09:15:00',
    '2023-04-17 12:15:00',
    1600.00,
    4,
    4,
    4,
    4,
    '2023-04-12 08:15:00',
    104
  ),
  (
    5,
    '2023-05-25 12:30:00',
    '2023-05-30 14:30:00',
    1750.00,
    5,
    5,
    5,
    5,
    '2023-05-25 11:30:00',
    105
  ),
  (
    6,
    '2023-06-18 14:45:00',
    '2023-06-23 17:45:00',
    1900.00,
    6,
    6,
    6,
    6,
    '2023-06-18 13:45:00',
    201
  ),
  (
    7,
    '2023-07-09 16:00:00',
    '2023-07-14 19:00:00',
    1700.00,
    7,
    7,
    7,
    7,
    '2023-07-09 15:00:00',
    202
  ),
  (
    8,
    '2023-08-30 17:30:00',
    '2023-09-04 20:30:00',
    1850.00,
    8,
    8,
    8,
    8,
    '2023-08-30 16:30:00',
    203
  ),
  (
    9,
    '2023-09-22 19:45:00',
    '2023-09-27 22:45:00',
    1950.00,
    9,
    9,
    9,
    9,
    '2023-09-22 18:45:00',
    204
  ),
  (
    10,
    '2023-10-07 21:00:00',
    '2023-10-12 23:00:00',
    2100.00,
    10,
    10,
    10,
    10,
    '2023-10-07 20:00:00',
    205
  );
-- Inserção de medicamentos na tabela 'medicamentos'
INSERT INTO medicamentos (Codigo, Descricao)
VALUES (1, 'Paracetamol'),
  (2, 'Ibuprofeno'),
  (3, 'Amoxicilina'),
  (4, 'Omeprazol'),
  (5, 'Atorvastatina'),
  (6, 'Dipirona'),
  (7, 'Ranitidina'),
  (8, 'Ciprofloxacino'),
  (9, 'Hidroclorotiazida'),
  (10, 'Losartana'),
  (11, 'Dexametasona'),
  (12, 'Metformina'),
  (13, 'Sinvastatina'),
  (14, 'Tramadol'),
  (15, 'Insulina'),
  (16, 'Clonazepam'),
  (17, 'Morfina'),
  (18, 'Warfarina'),
  (19, 'Aspirina'),
  (20, 'Prednisona');
-- Inserção de receitas de consulta na tabela 'receita_consulta'
INSERT INTO receita_consulta (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta,
    Codigo_medicamento
  )
VALUES (1, 1, 1, 1, '2023-01-15 09:00:00', 1),
  (2, 2, 2, 2, '2023-02-20 10:30:00', 2),
  (3, 3, 3, 3, '2023-03-03 14:45:00', 3),
  (4, 4, 4, 4, '2023-04-12 08:15:00', 4),
  (5, 5, 5, 5, '2023-05-25 11:30:00', 5),
  (6, 6, 6, 6, '2023-06-18 13:45:00', 6),
  (7, 7, 7, 7, '2023-07-09 15:00:00', 7),
  (8, 8, 8, 8, '2023-08-30 16:30:00', 8),
  (9, 9, 9, 9, '2023-09-22 18:45:00', 9),
  (10, 10, 10, 10, '2023-10-07 20:00:00', 10);
-- Inserção de receitas de internação na tabela 'receita_internacao'
INSERT INTO receita_internacao (Codigo_internacao, Codigo_medicamento, Data_hora)
VALUES (1, 1, '2023-01-15 10:00:00'),
  (2, 2, '2023-02-20 11:30:00'),
  (3, 3, '2023-03-03 15:45:00'),
  (4, 4, '2023-04-12 09:15:00'),
  (5, 5, '2023-05-25 12:30:00'),
  (6, 6, '2023-06-18 14:45:00'),
  (7, 7, '2023-07-09 16:00:00'),
  (8, 8, '2023-08-30 17:30:00'),
  (9, 9, '2023-09-22 19:45:00'),
  (10, 10, '2023-10-07 21:00:00');
-- Inserção de exames de consulta na tabela 'exame_consulta'
INSERT INTO exame_consulta (
    Codigo,
    Data_hora,
    Valor,
    Resultado,
    Codigo_tipo_exame,
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta
  )
VALUES (
    1,
    '2023-01-15 09:00:00',
    120.00,
    'Normal',
    1,
    1,
    1,
    1,
    1,
    '2023-01-15 09:00:00'
  ),
  (
    2,
    '2023-02-20 10:30:00',
    150.00,
    'Elevado',
    2,
    2,
    2,
    2,
    2,
    '2023-02-20 10:30:00'
  ),
  (
    3,
    '2023-03-03 14:45:00',
    100.00,
    'Normal',
    3,
    3,
    3,
    3,
    3,
    '2023-03-03 14:45:00'
  ),
  (
    4,
    '2023-04-12 08:15:00',
    180.00,
    'Elevado',
    4,
    4,
    4,
    4,
    4,
    '2023-04-12 08:15:00'
  ),
  (
    5,
    '2023-05-25 11:30:00',
    130.00,
    'Normal',
    5,
    5,
    5,
    5,
    5,
    '2023-05-25 11:30:00'
  ),
  (
    6,
    '2023-06-18 13:45:00',
    160.00,
    'Elevado',
    1,
    6,
    6,
    6,
    6,
    '2023-06-18 13:45:00'
  ),
  (
    7,
    '2023-07-09 15:00:00',
    110.00,
    'Normal',
    2,
    7,
    7,
    7,
    7,
    '2023-07-09 15:00:00'
  ),
  (
    8,
    '2023-08-30 16:30:00',
    140.00,
    'Elevado',
    3,
    8,
    8,
    8,
    8,
    '2023-08-30 16:30:00'
  ),
  (
    9,
    '2023-09-22 18:45:00',
    170.00,
    'Normal',
    4,
    9,
    9,
    9,
    9,
    '2023-09-22 18:45:00'
  ),
  (
    10,
    '2023-10-07 20:00:00',
    190.00,
    'Elevado',
    5,
    10,
    10,
    10,
    10,
    '2023-10-07 20:00:00'
  ),
  (
    11,
    '2023-11-15 09:30:00',
    125.00,
    'Normal',
    1,
    1,
    1,
    1,
    1,
    '2023-11-15 09:30:00'
  ),
  (
    12,
    '2023-12-20 10:45:00',
    155.00,
    'Elevado',
    2,
    2,
    2,
    2,
    2,
    '2023-12-20 10:45:00'
  ),
  (
    13,
    '2024-01-03 14:00:00',
    105.00,
    'Normal',
    3,
    3,
    3,
    3,
    3,
    '2024-01-03 14:00:00'
  ),
  (
    14,
    '2024-02-12 08:45:00',
    185.00,
    'Elevado',
    4,
    4,
    4,
    4,
    4,
    '2024-02-12 08:45:00'
  ),
  (
    15,
    '2024-03-25 11:15:00',
    135.00,
    'Normal',
    5,
    5,
    5,
    5,
    5,
    '2024-03-25 11:15:00'
  ),
  (
    16,
    '2024-04-18 13:30:00',
    165.00,
    'Elevado',
    1,
    6,
    6,
    6,
    6,
    '2024-04-18 13:30:00'
  ),
  (
    17,
    '2024-05-09 15:45:00',
    115.00,
    'Normal',
    2,
    7,
    7,
    7,
    7,
    '2024-05-09 15:45:00'
  ),
  (
    18,
    '2024-06-30 16:00:00',
    145.00,
    'Elevado',
    3,
    8,
    8,
    8,
    8,
    '2024-06-30 16:00:00'
  ),
  (
    19,
    '2024-07-22 18:15:00',
    175.00,
    'Normal',
    4,
    9,
    9,
    9,
    9,
    '2024-07-22 18:15:00'
  ),
  (
    20,
    '2024-08-07 19:30:00',
    195.00,
    'Elevado',
    5,
    10,
    10,
    10,
    10,
    '2024-08-07 19:30:00'
  );
-- Inserção de exames de internação na tabela ' exame_internacao '
INSERT INTO exame_internacao (
    Codigo,
    Data_hora,
    Valor,
    Resultado,
    Codigo_tipo_exame,
    Codigo_internacao
  )
VALUES (
    1,
    ' 2023-01-15 10:00:00 ',
    120.00,
    ' Normal ',
    1,
    1
  ),
  (
    2,
    ' 2023-02-20 11:30:00 ',
    150.00,
    ' Elevado ',
    2,
    2
  ),
  (
    3,
    ' 2023-03-03 15:45:00 ',
    100.00,
    ' Normal ',
    3,
    3
  ),
  (
    4,
    ' 2023-04-12 09:15:00 ',
    180.00,
    ' Elevado ',
    4,
    4
  ),
  (
    5,
    ' 2023-05-25 12:30:00 ',
    130.00,
    ' Normal ',
    5,
    5
  ),
  (
    6,
    ' 2023-06-18 14:45:00 ',
    160.00,
    ' Elevado ',
    1,
    6
  ),
  (
    7,
    ' 2023-07-09 16:00:00 ',
    110.00,
    ' Normal ',
    2,
    7
  ),
  (
    8,
    ' 2023-08-30 17:30:00 ',
    140.00,
    ' Elevado ',
    3,
    8
  ),
  (
    9,
    ' 2023-09-22 19:45:00 ',
    170.00,
    ' Normal ',
    4,
    9
  ),
  (
    10,
    ' 2023-10-07 21:00:00 ',
    190.00,
    ' Elevado ',
    5,
    10
  );
