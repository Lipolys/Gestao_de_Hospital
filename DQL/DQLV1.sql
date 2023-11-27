----------------------------------
-- DQL GESTAO DE HOSPITAL
----------------------------------

----------------------------------------------------------------
-- Questão 1) Listar os dados de todos os Pacientes cadastrados
----------------------------------------------------------------
SELECT * FROM pacientes;

----------------------------------------------------------------
-- Questão 2) Listar os dados de todos os Médicos cadastrados
----------------------------------------------------------------
SELECT * FROM medicos;

-------------------------------------------------------------------------------------
-- Questão 3) Listar os dados de todas as consultas realizadas no hospital
--            (pelo menos o nome do Paciente, Médico, data da consulta e convênio)
-------------------------------------------------------------------------------------
SELECT t1.nome AS nome_paciente, t2.nome AS nome_medico, t3.data_hora, t4.codigo AS codigo_convenio, t4.descricao AS descricao_convenio
FROM consulta t3
JOIN pacientes t1 ON t3.codigo_paciente = t1.codigo
JOIN medicos t2 ON t3.codigo_medico = t2.codigo
JOIN convenios t4 ON t3.codigo_convenio = t4.codigo;

-------------------------------------------------------------------------------------
-- Questão 4) Listar os dados de todas as internações realizadas no hospital
--            (pelo menos o nome do paciente, nome do médico que solicitou a internação,
--			  data da entrada e da saída, quarto que o paciente ficou internado)
-------------------------------------------------------------------------------------
SELECT t1.nome AS nome_paciente, t2.nome AS nome_medico, t3.data_entrada, t3.data_saida, t3.codigo_quarto AS num_do_quarto
FROM internacoes t3
JOIN pacientes t1 ON t3.codigo_paciente = t1.codigo
JOIN medicos t2 ON t3.codigo_medico = t2.codigo;

-------------------------------------------------------------------------------------
-- Questão 5) Listar todas as internações e os histórico das internações(apenas os exames)
--            (Dados da Internação conforme questão 4,
--            e os exames solicitados caso existam e seu resultado caso existam
-------------------------------------------------------------------------------------
SELECT t1.nome AS nome_paciente, t2.nome AS nome_medico, t3.data_entrada, t3.data_saida, t3.codigo_quarto AS num_do_quarto,

FROM internacoes t3
JOIN pacientes t1 ON t3.codigo_paciente = t1.codigo
JOIN medicos t2 ON t3.codigo_medico = t2.codigo;