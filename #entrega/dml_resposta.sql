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

-- @block Bookmarked query
-- @group Sistema Hospitalar
-- @name pergunta 20 v5 final (consolidando consultas e internações)
-- @description Listar os pacientes que já realizaram consultas, exames por consulta e por internação, internação e receberam medicamento em internação.
with total_geral_exames as (
    select count(*) + (
            select count(*)
            from exame_internacao
        ) as total
    from exame_consulta
),
total_exames_consulta as (
    select t1.codigo as codigo_exame,
        t1.descricao as descricao_exame,
        count(*) as total_exames_por_tipo
    from consulta as c1,
        exame_consulta as e1,
        tipo_exame as t1
    where (
            c1.codigo_paciente = e1.codigo_paciente
            and c1.codigo_convenio = e1.codigo_convenio
            and c1.codigo_medico = e1.codigo_medico
            and c1.codigo_especialidade = e1.codigo_especialidade
            and c1.data_hora = e1.data_consulta
            and t1.codigo = e1.codigo_tipo_exame
        )
    group by t1.codigo
    order by t1.descricao
),
total_exames_internacao as (
    select t1.codigo as codigo_exame,
        t1.descricao as descricao_exame,
        count(*) as total_exames_por_tipo
    from internacoes as i1,
        exame_internacao as e2,
        tipo_exame as t1
    where (
            i1.codigo = e2.codigo_internacao
            and t1.codigo = e2.codigo_tipo_exame
        )
    group by t1.codigo
    order by t1.descricao
)
select codigo_exame as codigo,
    descricao_exame as descricao,
    sum(total_exames_por_tipo) as total
from (
        select *
        from total_exames_consulta
        union all
        select *
        from total_exames_internacao
    ) as sq
group by descricao,
    codigo
order by descricao;
--
-- @block Sistema Hospitalar
-- @group pergunta 21 v2 final
-- @description Listar os médicos da especialidade que teve maior número de consulta
select t1.codigo as codigo_exame,
    t1.descricao as descricao_exame,
    c1.codigo_medico as codigo_medico,
    c1.codigo_especialidade as codigo_especialidade,
    e2.descricao as descricao_especialidade,
    count(*) as total_exames_por_especialidade
from consulta as c1,
    exame_consulta as e1,
    tipo_exame as t1,
    especialidades as e2
where (
        c1.codigo_paciente = e1.codigo_paciente
        and c1.codigo_convenio = e1.codigo_convenio
        and c1.codigo_medico = e1.codigo_medico
        and c1.codigo_especialidade = e1.codigo_especialidade
        and c1.codigo_especialidade = e2.codigo
        and c1.data_hora = e1.data_consulta
        and t1.codigo = e1.codigo_tipo_exame
    )
group by c1.codigo_medico,
    c1.codigo_especialidade,
    t1.codigo,
    e2.descricao,
    t1.codigo
order by total_exames_por_especialidade;
-- @block Sistema Hospitalar
-- @group pergunta 22 v2 final
-- @description Fazer uma consulta com a estatística de médicos por especialidade, ou seja a quantidade de médicos por especialidade.
select e2.codigo as codigo_especialidade,
    e2.descricao as descricao_especialidade,
    count(*) as total_medicos_por_especialidade
from especialista as e1,
    medicos as m1,
    especialidades as e2
where (
        e1.codigo_medico = m1.codigo
        and e1.codigo_especialidade = e2.codigo
    )
group by e2.codigo;
--
-- @block Sistema Hospitalar
-- @group pergunta 23 v2 final
-- @description Fazer uma consulta com a estatística de quantos exames, internações e consultas realizadas por médico, ou seja listar: médico, totalexames, totalinternacoes, totalconsultas.
with medicos_consulta as (
    select m1.codigo as codigo_medico,
        count(*) as total_consultas
    from consulta as c1,
        medicos as m1
    where c1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_internacao as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        count(*) as total_internacoes
    from internacoes as i1,
        medicos as m1
    where i1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_exame_consulta as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        count(*) as total_exames_consulta
    from exame_consulta as e1,
        medicos as m1
    where e1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_exame_internacao as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        count(*) as total_exames_internacao
    from exame_internacao as e2,
        internacoes as i1,
        medicos as m1
    where i1.codigo = e2.codigo_internacao
        and i1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_exames_totais as (
    select codigo_medico,
        nome_medico,
        sum(total_exames_consulta) as total_exames
    from (
            select *
            from medicos_exame_consulta
            union all
            select *
            from medicos_exame_internacao
        ) as sq
    group by codigo_medico,
        nome_medico
)
select m1.codigo as codigo_medico,
    m1.nome as nome_medico,
    mc.total_consultas as total_consultas,
    mi.total_internacoes as total_internacoes,
    mt.total_exames as total_exames
from medicos as m1,
    medicos_consulta as mc,
    medicos_internacao as mi,
    medicos_exames_totais as mt
where (
        m1.codigo = mc.codigo_medico
        and m1.codigo = mc.codigo_medico
        and m1.codigo = mi.codigo_medico
        and m1.codigo = mt.codigo_medico
    );
--
-- @block Sistema Hospitalar
-- @group pergunta 24 v3 final
-- @description Listar os pacientes que já realizaram consultas, exames por consulta e por internação, internação e receberam medicamento em internação.
with pacientes_consulta as (
    select m1.codigo as codigo_paciente,
        count(*) as total_consultas
    from consulta as c1,
        pacientes as m1
    where c1.codigo_paciente = m1.codigo
    group by m1.codigo
),
pacientes_internacao as (
    select m1.codigo as codigo_paciente,
        m1.nome as nome_paciente,
        count(*) as total_internacoes
    from internacoes as i1,
        pacientes as m1
    where i1.codigo_paciente = m1.codigo
    group by m1.codigo
),
pacientes_exame_consulta as (
    select m1.codigo as codigo_paciente,
        m1.nome as nome_paciente,
        count(*) as total_exames_consulta
    from exame_consulta as e1,
        pacientes as m1
    where e1.codigo_paciente = m1.codigo
    group by m1.codigo
),
pacientes_exame_internacao as (
    select m1.codigo as codigo_paciente,
        m1.nome as nome_paciente,
        count(*) as total_exames_internacao
    from exame_internacao as e2,
        internacoes as i1,
        pacientes as m1
    where i1.codigo = e2.codigo_internacao
        and i1.codigo_paciente = m1.codigo
    group by m1.codigo
),
pacientes_exames_totais as (
    select codigo_paciente,
        nome_paciente,
        sum(total_exames_consulta) as total_exames
    from (
            select *
            from pacientes_exame_consulta
            union all
            select *
            from pacientes_exame_internacao
        ) as sq
    group by codigo_paciente,
        nome_paciente
),
pacientes_receita_internacao as (
    select p1.codigo as codigo_paciente,
        p1.nome as nome_paciente,
        coalesce(count(r1.data_hora), 0) as total_medicacoes_internacao
    from pacientes as p1
        inner join internacoes as i1 on i1.codigo_paciente = p1.codigo
        left join receita_internacao as r1 on r1.codigo_internacao = i1.codigo
    group by p1.codigo
)
select m1.codigo as codigo_paciente,
    m1.nome as nome_paciente,
    mc.total_consultas,
    mi.total_internacoes,
    mt.total_exames,
    mr.total_medicacoes_internacao
from pacientes as m1,
    pacientes_consulta as mc,
    pacientes_internacao as mi,
    pacientes_exames_totais as mt,
    pacientes_receita_internacao as mr
where (
        m1.codigo = mc.codigo_paciente
        and m1.codigo = mc.codigo_paciente
        and m1.codigo = mi.codigo_paciente
        and m1.codigo = mt.codigo_paciente
        and m1.codigo = mr.codigo_paciente
        and mr.total_medicacoes_internacao > 0
    );
--
-- @block Sistema Hospitalar
-- @group pre-pergunta 25
-- @description Preparar para base atender ao critério de ter uma tupla como resposta
delete from public.exame_internacao
where codigo = 1;
-- @block Sistema Hospitalar
-- @group pergunta 25 v5 final
-- @description Listar os médicos que já realizaram consultas, solicitaram exames em consultas, e nunca solicitaram exames em internação
with medicos_consulta as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        coalesce(count(c1.data_hora), 0) as total_consultas
    from medicos as m1
        left join consulta as c1 on c1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_exame_consulta as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        coalesce(count(ec1.codigo), 0) as total_exames_em_consultas
    from medicos as m1
        left join exame_consulta as ec1 on ec1.codigo_medico = m1.codigo
    group by m1.codigo
),
medicos_exame_internacao as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        coalesce(count(ei1.codigo), 0) as total_exames_em_internacoes
    from medicos as m1
        left join internacoes as i1 on i1.codigo_medico = m1.codigo
        left join exame_internacao as ei1 on ei1.codigo = i1.codigo
    group by m1.codigo
)
select m1.codigo as codigo_medico,
    m1.nome as nome_medico,
    mc.total_consultas,
    mec.total_exames_em_consultas,
    mei.total_exames_em_internacoes
from medicos as m1,
    medicos_consulta as mc,
    medicos_exame_consulta as mec,
    medicos_exame_internacao as mei
where (
        m1.codigo = mc.codigo_medico
        and m1.codigo = mec.codigo_medico
        and m1.codigo = mei.codigo_medico
        and mec.total_exames_em_consultas > 0
        and mei.total_exames_em_internacoes = 0
    );
--
-- @block Sistema Hospitalar
-- @group pergunta 26 v3 Final
-- @description Listar os médicos que menos solicitaram exames.
with medico_exame_consulta as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        coalesce(count(ec1.codigo), 0) as total_exames_consultas
    from medicos as m1
        left join exame_consulta as ec1 on ec1.codigo_medico = m1.codigo
    group by m1.codigo
),
medico_exame_internacao as (
    select m1.codigo as codigo_medico,
        m1.nome as nome_medico,
        coalesce(count(ei1.codigo), 0) as total_exames_internacoes
    from medicos as m1
        left join internacoes as i1 on i1.codigo_medico = m1.codigo
        left join exame_internacao as ei1 on ei1.codigo = i1.codigo
    group by m1.codigo
),
medicos_exames_totais as (
    select codigo_medico,
        nome_medico,
        sum(total_exames_consultas) as total_exames
    from (
            select *
            from medico_exame_consulta
            union all
            select *
            from medico_exame_internacao
        ) as sq
    group by codigo_medico,
        nome_medico
)
select codigo_medico,
    nome_medico,
    total_exames
from medicos_exames_totais
where total_exames < (
        select avg(total_exames)
        from medicos_exames_totais
    );
--
-- @block Sistema Hospitalar
-- @group pergunta 27 v3 final
-- @description Faça vocês do grupo uma pergunta que necessite utilizar funções agregadas e subconsulta para obter a resposta.
-- @notes Pergunta: Consultar o faturamento total em exames de tipo 'hemograma' e o maior valor pago para realizar este exame.
select e3.codigo as codigo_exame,
    e3.descricao as descricao_exame,
    sum(e3.valor) as total_faturamento,
    max(e3.valor) as maior_valor_pago
from (
        select t1.codigo as codigo,
            t1.descricao as descricao,
            e1.valor as valor
        from exame_consulta as e1,
            tipo_exame as t1
        where t1.codigo = e1.codigo_tipo_exame
        union all
        select t2.codigo as codigo,
            t2.descricao as descricao,
            e2.valor as valor
        from exame_internacao as e2,
            tipo_exame as t2
        where t2.codigo = e2.codigo_tipo_exame
    ) as e3 --
where e3.codigo = 1 -- 'Hemograma'
group by e3.codigo,
    e3.descricao
order by e3.descricao;
--
-- @block Sistema Hospitalar
-- @group pergunta 28 v2 final
-- @description Fazer uma consulta que liste o faturamento por mês separado por consulta, exame e internações.Formato de saída: Mês, valorTotalConsultas, ValorTotalExames, ValorTotalInternações.
select to_char(c1.data_hora, 'YYYY/MM') as mes,
    sum(e1.valor) as total_consultas,
    sum(ec1.valor + ei1.valor) as total_exames,
    sum(i1.valor) as total_internacoes
from consulta as c1,
    especialidades as e0,
    especialista_conveniado as e1,
    internacoes as i1,
    exame_consulta as ec1,
    exame_internacao as ei1
where (
        e0.codigo = c1.codigo_especialidade
        and e1.codigo_convenio = c1.codigo_convenio
        and e1.codigo_medico = c1.codigo_medico
        and e1.codigo_especialidade = c1.codigo_especialidade
        and i1.codigo_paciente = c1.codigo_paciente
        and ec1.codigo_paciente = c1.codigo_paciente
        and ec1.codigo_convenio = c1.codigo_convenio
        and ec1.codigo_medico = c1.codigo_medico
        and ec1.codigo_especialidade = c1.codigo_especialidade
        and ec1.data_consulta = c1.data_hora
        and ei1.codigo_internacao = c1.codigo_paciente
    )
group by c1.data_hora,
    e0.descricao
order by c1.data_hora;