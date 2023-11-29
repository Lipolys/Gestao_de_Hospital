-- #####
-- * *****
-- * File: MassaDeDados1testeV1.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Tuesday, 28 November 2023 10:23:55
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Tuesday, 28 November 2023 21:52:22
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
-- @name Registros de teste v3
-- Inserção de especialistas na tabela 'especialista'
-- INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
-- VALUES (90, 1);
-- Inserção de especialistas conveniados na tabela 'especialista_conveniado'
INSERT INTO especialista_conveniado (
        Codigo_convenio,
        Codigo_medico,
        Codigo_especialidade,
        Valor
    )
VALUES (1, 1, 90, 250.00);
-- Inserção de consultas na tabela 'consulta'
-- INSERT INTO consulta (
--         Codigo_paciente,
--         Codigo_convenio,
--         Codigo_medico,
--         Codigo_especialidade,
--         Data_hora
--     )
-- VALUES (1, 1, 90, 1, '2023-01-15 19:00:00'),
--     (1, 1, 90, 1, '2023-11-15 19:30:00');