------------------------------------------
--11 - Qual o paciente que mais fez exames
------------------------------------------
  SELECT
  ec.Codigo_paciente,
  p.Nome AS Nome_Paciente,
  COUNT(ec.Codigo) AS Total_Exames
FROM
  exame_consulta ec
INNER JOIN
  pacientes p ON ec.Codigo_paciente = p.Codigo
GROUP BY
  ec.Codigo_paciente, p.Nome
ORDER BY
  Total_Exames DESC
  LIMIT 1;
--------------------------------------------
--12 - Qual o paciente que menos fez exames.
--------------------------------------------
SELECT
  ec.Codigo_paciente,
  p.Nome AS Nome_Paciente,
  COUNT(ec.Codigo) AS Total_Exames
FROM
  exame_consulta ec
INNER JOIN
  pacientes p ON ec.Codigo_paciente = p.Codigo
GROUP BY
  ec.Codigo_paciente, p.Nome
ORDER BY
  Total_Exames ASC
  LIMIT 1;
---------------------------------------------------------------
--13 - Qual o médico mais produtivo(que mais atendeu consultas).
---------------------------------------------------------------
SELECT
  c.Codigo_medico,
  m.Nome AS Nome_Medico,
  COUNT(c.codigo_paciente) AS Total_Consultas
FROM
  consulta c
INNER JOIN
  medicos m ON c.Codigo_medico = m.Codigo
GROUP BY
  c.Codigo_medico, m.Nome
ORDER BY
  Total_Consultas DESC;
-----------------------------------------------
--14 - Qual o médico que menos solicita exames.
-----------------------------------------------
SELECT
  ec.Codigo_medico,
  m.Nome AS Nome_Medico,
  COUNT(ec.Codigo) AS Total_Exames_Solicitados
FROM
  exame_consulta ec
INNER JOIN
  medicos m ON ec.Codigo_medico = m.Codigo
GROUP BY
  ec.Codigo_medico, m.Nome
ORDER BY
  Total_Exames_Solicitados ASC;
----------------------------------------------
--15 - Qual o médico que mais solicita exames.
----------------------------------------------
SELECT
  ec.Codigo_medico,
  m.Nome AS Nome_Medico,
  COUNT(ec.Codigo) AS Total_Exames_Solicitados
FROM
  exame_consulta ec
INNER JOIN
  medicos m ON ec.Codigo_medico = m.Codigo
GROUP BY
  ec.Codigo_medico, m.Nome
ORDER BY
  Total_Exames_Solicitados DESC;
---------------------------------------
--16 - Qual exame nunca foi solicitado.
---------------------------------------
SELECT
  te.Codigo AS Codigo_Tipo_Exame,
  te.Descricao AS Descricao_Tipo_Exame
FROM
  tipo_exame te
WHERE
  NOT EXISTS (
    SELECT 1
    FROM
      exame_consulta ec
    WHERE
      ec.Codigo_tipo_exame = te.Codigo
  );
------------------------------------
--17 - Qual o exame mais solicitado.
------------------------------------

SELECT
  te.Codigo AS Codigo_Tipo_Exame,
  te.Descricao AS Descricao_Tipo_Exame,
  COUNT(ec.Codigo) AS Total_Solicitacoes
FROM
  tipo_exame te
LEFT JOIN
  exame_consulta ec ON te.Codigo = ec.Codigo_tipo_exame
GROUP BY
  te.Codigo, te.Descricao
ORDER BY
  Total_Solicitacoes DESC
  LIMIT 1;
--------------------------------------------------------------------------------------------------------------
--18 - Fazer uma consulta com a estatística de pacientes por sexo, ou seja a quantidade de pacientes por sexo.
--------------------------------------------------------------------------------------------------------------
SELECT
  Sexo,
  COUNT(Codigo) AS Total_Pacientes
FROM
  pacientes
GROUP BY
  Sexo;
--------------------------------------------------------------------
--19 - Fazer uma consulta com a estatística de pacientes por cidade.
--------------------------------------------------------------------
SELECT
  CONCAT(endereço, ', ', logradouro, ', ', complemento) AS Endereco_Completo,
  COUNT(Codigo) AS Total_Pacientes
FROM
  pacientes
GROUP BY
  Endereco_Completo;
