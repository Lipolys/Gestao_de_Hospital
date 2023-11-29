INSERT INTO public.internacoes
(codigo, data_entrada, data_saida, valor, codigo_paciente, codigo_convenio, codigo_medico, codigo_especialidade, data_consulta, codigo_quarto)
VALUES(1, '2023-01-15 10:00:00.000', '2023-01-20 14:00:00.000', 1500.0, 1, 1, 1, 1, '2023-01-15 09:00:00.000', 101);
INSERT INTO public.receita_internacao
(codigo_internacao, codigo_medicamento, data_hora)
VALUES(1, 1, '2023-01-15 10:00:00.000');
INSERT INTO public.exame_internacao
(codigo, data_hora, valor, resultado, codigo_tipo_exame, codigo_internacao)
VALUES(1, '2023-01-15 10:00:00.000', 120.0, ' Normal ', 1, 1);