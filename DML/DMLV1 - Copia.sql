----------------------------
-- DML Gestão de Hospital
----------------------------

-------------------------
-- DML PACIENTES
-------------------------
INSERT INTO pacientes (Codigo, CPF, Nome, Data_de_nascimento, Telefone, Logradouro, Endereço, Complemento)
VALUES
(1, 12345678900, 'João Silva', '1990-01-15', 1122334455, 'Rua A', 'Bairro X', 'Apto 101'),
(2, 98765432100, 'Maria Oliveira', '1985-05-20', 9988776655, 'Rua B', 'Bairro Y', 'Casa 202'),
(3, 11223344556, 'Carlos Santos', '1995-09-10', 5544332211, 'Rua C', 'Bairro Z', 'Sala 303'),
(4, 44556677899, 'Ana Pereira', '1998-12-25', 7788996655, 'Rua D', 'Bairro W', 'Apto 404'),
(5, 99887766554, 'José Souza', '1992-03-30', 3322114455, 'Rua E', 'Bairro V', 'Casa 505'),
(6, 77889966554, 'Paula Lima', '1991-07-05', 6655443322, 'Rua F', 'Bairro U', 'Sala 606'),
(7, 33221144556, 'Pedro Costa', '1993-11-20', 2211445566, 'Rua G', 'Bairro T', 'Apto 707'),
(8, 66554433221, 'Mariana Rodrigues', '1994-04-15', 4455667788, 'Rua H', 'Bairro S', 'Casa 808'),
(9, 22114455665, 'Fernanda Almeida', '1996-08-10', 5566778899, 'Rua I', 'Bairro R', 'Sala 909'),
(10, 44556677889, 'Rafaela Alves', '1997-02-05', 7788996655, 'Rua J', 'Bairro Q', 'Apto 1010');

-------------------------
-- DML CONVENIOS
-------------------------
INSERT INTO convenios (Codigo, Descricao)
VALUES
(1, 'Particular'),
(2, 'Unimed'),
(3, 'Ipasgo'),
(4, 'Bradesco'),
(5, 'Sulamerica');

-------------------------
-- DML MEDICOS
-------------------------
INSERT INTO medicos (Codigo, Nome)
VALUES
(1, 'Doutor Oliveira'),
(2, 'Doutora Silva'),
(3, 'Doutor Pereira');

-------------------------
-- DML ESPECIALIDADES
-------------------------
INSERT INTO especialidades (Codigo, Descricao)
VALUES
(1, 'Cardiologia'),
(2, 'Ortopedia'),
(3, 'Clinico Geral'),
(4, 'Pediatria'),
(5, 'Ginecologia');

---------------------------
-- DML PACIENTE_CONVENIADO
---------------------------
INSERT INTO paciente_conveniado (Codigo_paciente, Codigo_convenio)
VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(10, 1);

---------------------------
-- DML ESPECIALISTA
---------------------------
INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
VALUES
(1, 1),
(2, 2),
(3, 3);

-------------------------------
-- DML ESPECIALISTA_CONVENIADO
-------------------------------
INSERT INTO especialista_conveniado (Codigo_convenio, Codigo_medico, Codigo_especialidade, Valor)
VALUES
(1, 1, 1, 150.00),
(2, 2, 2, 200.00),
(3, 3, 3, 250.00);

---------------------------
-- DML CONSULTA
---------------------------
INSERT INTO consulta (Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_hora)
VALUES
(1, 1, 1, 1, '2023-01-01 10:00:00'),
(2, 2, 2, 2, '2023-02-01 11:30:00'),
(3, 3, 3, 3, '2023-03-01 15:00:00');

---------------------------
-- DML QUARTOS
---------------------------
INSERT INTO quartos (Codigo)
VALUES
(101),
(102),
(103);

---------------------------
-- DML INTERNACOES
---------------------------
INSERT INTO internacoes (Codigo, Data_entrada, Data_Saida, Valor, Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta, Codigo_quarto)
VALUES
(1, '2023-01-01 10:00:00', '2023-01-03 14:00:00', 5000.00, 1, 1, 1, 1, '2023-01-01 10:00:00', 101),
(2, '2023-02-01 11:30:00', '2023-02-03 16:00:00', 6000.00, 2, 2, 2, 2, '2023-02-01 11:30:00', 102),
(3, '2023-03-01 15:00:00', '2023-03-03 18:30:00', 7000.00, 3, 3, 3, 3, '2023-03-01 15:00:00', 103);

---------------------------
-- DML MEDICAMENTOS
---------------------------
INSERT INTO medicamentos (Codigo, Descricao)
VALUES
(1, 'Paracetamol'),
(2, 'Amoxicilina'),
(3, 'Omeprazol');

---------------------------
-- DML RECEITA_CONSULTA
---------------------------
INSERT INTO receita_consulta (Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta, Codigo_medicamento)
VALUES
(1, 1, 1, 1, '2023-01-01 10:00:00', 1),
(2, 2, 2, 2, '2023-02-01 11:30:00', 2),
(3, 3, 3, 3, '2023-03-01 15:00:00', 3);

---------------------------
-- DML RECEITA_INTERNACAO
---------------------------
INSERT INTO receita_internacao (Codigo_internacao, Codigo_medicamento, Data_hora)
VALUES
(1, 1, '2023-01-01 10:00:00'),
(2, 2, '2023-02-01 11:30:00'),
(3, 3, '2023-03-01 15:00:00');

---------------------------
-- DML EXAME_CONSULTA
---------------------------
INSERT INTO exame_consulta (Codigo, Data_hora, Valor, Resultado, Codigo_tipo_exame, Codigo_paciente, Codigo_convenio, Codigo_medico, Codigo_especialidade, Data_consulta)
VALUES
(1, '2023-01-01 10:00:00', 200.00, 'Normal', 1, 1, 1, 1, 1, '2023-01-01 10:00:00'),
(2, '2023-02-01 11:30:00', 250.00, 'Anormal', 2, 2, 2, 2, 2, '2023-02-01 11:30:00'),
(3, '2023-03-01 15:00:00', 300.00, 'Normal', 3, 3, 3, 3, 3, '2023-03-01 15:00:00');

---------------------------
-- DML EXAME_INTERNACAO
---------------------------
INSERT INTO exame_internacao (Codigo, Data_hora, Valor, Resultado, Codigo_tipo_exame, Codigo_internacao)
VALUES
(1, '2023-01-01 10:00:00', 400.00, 'Normal', 1, 1),
(2, '2023-02-01 11:30:00', 450.00, 'Anormal', 2, 2),
(3, '2023-03-01 15:00:00', 500.00, 'Normal', 3, 3);