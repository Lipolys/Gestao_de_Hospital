-- #####
-- * *****
-- * File: MassaDeDados1testeV1.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Tuesday, 28 November 2023 10:23:55
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Tuesday, 28 November 2023 21:03:58
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
-- @name Registros de teste v2
-- Inserção de médicos na tabela 'medicos'
INSERT INTO medicos (Codigo, Nome)
VALUES (90, 'Dr. Martins Coelho');
-- Inserção de especialistas na tabela 'especialista'
INSERT INTO especialista (Codigo_medico, Codigo_especialidade)
VALUES (90, 1);