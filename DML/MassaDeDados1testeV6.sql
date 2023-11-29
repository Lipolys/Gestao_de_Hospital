-- #####
-- * *****
-- * File: MassaDeDados1.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Tuesday, 28 November 2023 10:23:55
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Wednesday, 29 November 2023 18:41:20
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
-- Inserção de especialistas na tabela 'especialista'
INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
VALUES (90, 1);
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name nome do script sql
-- @description descrição do script sql
-- Inserção de especialistas conveniados na tabela 'especialista_conveniado'
INSERT INTO especialista_conveniado (
        Codigo_convenio,
        Codigo_medico,
        Codigo_especialidade,
        Valor
    )
VALUES (1, 90, 1, 230.00);
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name nome do script sql
-- @description descrição do script sql
-- Inserção de consultas na tabela 'consulta'
INSERT INTO consulta (
        Codigo_paciente,
        Codigo_convenio,
        Codigo_medico,
        Codigo_especialidade,
        Data_hora
    )
VALUES (1, 1, 90, 1, '2025-02-25 19:00:00');
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name nome do script sql
-- @description descrição do script sql
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
        91,
        '2025-02-25 19:00:00',
        230.00,
        'Normal',
        1,
        1,
        1,
        90,
        1,
        '2025-02-25 19:00:00'
    );