-- antes da questão 24
DELETE FROM public.receita_internacao
WHERE codigo_internacao=7 AND codigo_medicamento=7 AND data_hora='2023-07-09 16:00:00.000';
-- depois da questão 24
INSERT INTO public.receita_internacao
(codigo_internacao, codigo_medicamento, data_hora)
VALUES(7, 7, '2023-07-09 16:00:00.000');
