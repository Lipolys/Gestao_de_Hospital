-- #####
-- * *****
-- * File: MassaDeDados1testeV1.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Tuesday, 28 November 2023 10:23:55
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Friday, 01 December 2023 17:29:17
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
-- @name Registros de teste v1
-- Deleção de exames de consulta na tabela 'exame_consulta'
DELETE FROM public.exame_consulta
WHERE codigo = 90;
DELETE FROM public.exame_internacao
WHERE codigo = 90;
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name Registros de teste v1
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
        90,
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
-- @block Bookmarked query
-- @group BD2 Guiliano
-- @name Registros de teste v1
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
        90,
        ' 2023-10-07 21:00:00 ',
        190.00,
        ' Elevado ',
        5,
        10
    );