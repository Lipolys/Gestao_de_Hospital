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
t5.descricao as nome_do_exame, t4.resultado
FROM internacoes t3
JOIN pacientes t1 ON t3.codigo_paciente = t1.codigo
JOIN medicos t2 ON t3.codigo_medico = t2.codigo
JOIN exame_internacao t4 ON t3.codigo = t4.codigo_internacao
JOIN tipo_exame t5 ON t4.codigo_tipo_exame = t5.codigo;


-------------------------------------------------------------------------------------
-- Questão 6) Listar todas as internações e os histórico das internações
--            (apenas os medicamentos ministrados).(Dados da Internação conforme questão 4,
--            e os medicamentos ministrados com a data e hora)
-------------------------------------------------------------------------------------
SELECT t1.nome AS nome_paciente, t2.nome AS nome_medico, t3.data_entrada, t3.data_saida, t3.codigo_quarto AS num_do_quarto,
t5.descricao as nome_do_medicamento, t4.data_hora
FROM internacoes t3
JOIN pacientes t1 ON t3.codigo_paciente = t1.codigo
JOIN medicos t2 ON t3.codigo_medico = t2.codigo
JOIN receita_internacao t4 ON t3.codigo = t4.codigo_internacao
JOIN medicamentos t5 ON t4.codigo_medicamento = t5.codigo;


-------------------------------------------------------------------------------------
-- Questão 7) Fazer uma consulta com a estatística de atendimento em consulta realizado pelos médicos.
--            Ou seja a quantidade de pacientes atendido pelos médicos em um intervalo de data.
--            (o intervalo será definido conforme a sua massa de dados).
-------------------------------------------------------------------------------------
SELECT t1.Codigo AS codigo_medico, t1.Nome AS nome_medico, COUNT(DISTINCT t2.Codigo_paciente) AS quantidade_qonsultas
FROM medicos t1                                            --Percebemos que a questão pede quantidade de PACIENTES, por isso a escolha
LEFT JOIN consulta t2 ON t1.Codigo = t2.Codigo_medico      --do "DISTINCT t2.CodigoPaciente". Para quantidade de CONSULTAS, trocar por "t2.Data_hora"
WHERE t2.data_hora >= '2023-02-01 11:30:00' AND t2.data_hora <= '2023-05-01 15:00:00'
GROUP BY t1.Codigo, t1.Nome
ORDER BY codigo_medico ASC


-------------------------------------------------------------------------------------
-- Questão 8) Fazer uma consulta com a estatística de atendimento em consulta 
--            realizado pelos médicos com detalhamento por convênio, ou seja 
--            listar a quantidade de atendimento realizados pelo médico por convênio.
-------------------------------------------------------------------------------------
SELECT t1.Codigo AS codigo_medico, t1.Nome AS nome_medico, t2.Codigo AS codigo_convenio, t2.Descricao AS descricao_convenio,
COUNT(t3.Data_hora) AS Quantidade_Atendimentos
FROM medicos t1
JOIN consulta t3 ON t1.Codigo = t3.Codigo_medico
JOIN convenios t2 ON t3.Codigo_convenio = t2.Codigo
GROUP BY t1.Codigo, t1.Nome, t2.Codigo, t2.Descricao
ORDER BY Codigo_Medico, Codigo_Convenio;


-------------------------------------------------------------------------------------
-- Questão 9) Listar os Paciente que nunca fizeram exames.
-------------------------------------------------------------------------------------
SELECT t1.Codigo AS codigo_paciente, t1.nome AS nome_paciente
FROM pacientes t1
LEFT JOIN exame_consulta t2 ON t1.Codigo = t2.Codigo_paciente
LEFT JOIN exame_internacao t3 ON t1.Codigo = t3.Codigo_internacao
WHERE t2.Codigo IS NULL AND t3.Codigo IS NULL;


-------------------------------------------------------------------------------------
-- Questão 10) Qual o paciente que mais fez consultas.
-------------------------------------------------------------------------------------
SELECT t1.Codigo AS codigo_paciente, t1.Nome AS nome_paciente, COUNT(t2.codigo_paciente) AS quantidade_consultas
FROM pacientes t1
JOIN paciente_conveniado t3 ON t1.Codigo = t3.Codigo_paciente
JOIN consulta t2 ON t3.Codigo_paciente = t2.Codigo_paciente AND t3.Codigo_convenio = t2.Codigo_convenio
GROUP BY t1.Codigo, t1.Nome
ORDER BY Quantidade_Consultas DESC
LIMIT 1;