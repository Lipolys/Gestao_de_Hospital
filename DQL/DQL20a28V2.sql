-- #####
-- * *****
-- * File: Respostas 20 em diante.sql
-- * Project: Banco de Dados II - Prof. Guiliano
-- * Path: /home/marcos/.path-shortcuts/bd2
-- * File Created: Monday, 27 November 2023 21:41:07
-- * Author: Marcos Antônio Barbosa de Souza (desouza.marcos@uol.com.br)
-- * -----
-- * Last Modified: Tuesday, 28 November 2023 20:48:32
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
-- @group Sistema Hospitalar
-- @name pergunta 20 v1 (somente totalizadores)
-- @description Fazer uma consulta com a estatística de exames solicitados,
-- ou seja a quantidade de solicitações por exames cadastrados.(
-- lembrando que exames podem ser solicitados em consultas ou em prontuários de internação).
select count(*) + (
        select count(*)
        from exame_internacao
    ) as total_geral_exames
from exame_consulta;
--
-- @block Bookmarked query
-- @group Sistema Hospitalar
-- @name pergunta 20 v2 (somente consultas)
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
order by t1.descricao;
-- @block Bookmarked query
-- @group Sistema Hospitalar
-- @name pergunta 20 v3 (somente internações)
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
order by t1.descricao;
-- @block Bookmarked query
-- @group Sistema Hospitalar
-- @name pergunta 20 v4 (somente internações -> teste)
select count(*) + (
        select count(*)
        from exame_internacao
    ) as total
from exame_consulta;
-- @block Bookmarked query
-- @group Sistema Hospitalar
-- @name pergunta 20 v5 (consolidando consultas e internações)
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
-- @group pergunta 21 vFinal
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