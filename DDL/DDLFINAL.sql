----------------------------
-- DDL Gestão de Hospital
----------------------------
----------------------------
-- PACIENTES
----------------------------
CREATE TABLE pacientes(
  Codigo INT NOT NULL,
  CPF BIGINT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Sexo CHAR(1) NOT NULL,
  Data_de_nascimento DATE NOT NULL,
  Telefone BIGINT NOT NULL,
  Logradouro VARCHAR(45) NOT NULL,
  Endereço VARCHAR(45) NOT NULL,
  Complemento VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
----------------------------
-- DDL CONVENIOS
----------------------------
CREATE TABLE convenios(
  Codigo INT NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
----------------------------
-- DDL MEDICOS
----------------------------
CREATE TABLE medicos(
  Codigo INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
----------------------------
-- DDL ESPECIALIDADES
----------------------------
CREATE TABLE especialidades(
  Codigo INT NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
---------------------------------
-- DDL TIPO_EXAME
---------------------------------
CREATE TABLE tipo_exame(
  Codigo INT NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
----------------------------
-- DDL PACIENTE_CONVENIADO
----------------------------
CREATE TABLE paciente_conveniado(
  Codigo_paciente INT NOT NULL,
  Codigo_convenio INT NOT NULL,
  PRIMARY KEY (Codigo_paciente, Codigo_convenio),
  FOREIGN KEY (Codigo_paciente) REFERENCES pacientes (Codigo),
  FOREIGN KEY (Codigo_convenio) REFERENCES convenios (Codigo)
);
----------------------------
-- DDL ESPECIALISTA
----------------------------
CREATE TABLE especialista(
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  PRIMARY KEY (Codigo_medico, Codigo_especialidade),
  FOREIGN KEY (Codigo_medico) REFERENCES medicos (Codigo),
  FOREIGN KEY (Codigo_especialidade) REFERENCES especialidades (Codigo)
);
-------------------------------
-- DDL ESPECIALISTA_CONVENIADO
-------------------------------
CREATE TABLE especialista_conveniado(
  Codigo_convenio INT NOT NULL,
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  Valor FLOAT NOT NULL,
  PRIMARY KEY (
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade
  ),
  FOREIGN KEY (Codigo_convenio) REFERENCES convenios (Codigo),
  FOREIGN KEY (Codigo_medico, Codigo_especialidade) REFERENCES especialista (Codigo_medico, Codigo_especialidade)
);
----------------------------
-- DDL CONSULTA
----------------------------
CREATE TABLE consulta(
  Codigo_paciente INT NOT NULL,
  Codigo_convenio INT NOT NULL,
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  Data_hora TIMESTAMP NOT NULL,
  PRIMARY KEY (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_hora
  ),
  FOREIGN KEY (Codigo_paciente, Codigo_convenio) REFERENCES paciente_conveniado (Codigo_paciente, Codigo_convenio),
  FOREIGN KEY (
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade
  ) REFERENCES especialista_conveniado (
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade
  )
);
----------------------------
-- DDL QUARTOS
----------------------------
CREATE TABLE quartos(Codigo INT NOT NULL, PRIMARY KEY (Codigo));
----------------------------
-- DDL INTERNACOES
----------------------------
CREATE TABLE internacoes(
  Codigo INT NOT NULL,
  Data_entrada TIMESTAMP NOT NULL,
  Data_Saida TIMESTAMP,
  Valor FLOAT NOT NULL,
  Codigo_paciente INT NOT NULL,
  Codigo_convenio INT NOT NULL,
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  Data_consulta TIMESTAMP NOT NULL,
  Codigo_quarto INT NOT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta
  ) REFERENCES consulta (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_hora
  ),
  FOREIGN KEY (Codigo_quarto) REFERENCES quartos (Codigo)
);
-----------------------------------
-- DDL INDICE UNICO DE INTERNACAO
-----------------------------------
CREATE UNIQUE INDEX idx_consulta_internacao ON internacoes (
  Codigo_paciente,
  Codigo_convenio,
  Codigo_medico,
  Codigo_especialidade,
  Data_consulta
);
----------------------------
-- DDL MEDICAMENTOS
----------------------------
CREATE TABLE medicamentos(
  Codigo INT NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo)
);
----------------------------
-- DDL RECEITA_CONSULTA
----------------------------
CREATE TABLE receita_consulta(
  Codigo_paciente INT NOT NULL,
  Codigo_convenio INT NOT NULL,
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  Data_consulta TIMESTAMP NOT NULL,
  Codigo_medicamento INT NOT NULL,
  PRIMARY KEY (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta,
    Codigo_medicamento
  ),
  FOREIGN KEY (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta
  ) REFERENCES consulta (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_hora
  ),
  FOREIGN KEY (Codigo_medicamento) REFERENCES medicamentos (Codigo)
);
----------------------------
-- DDL RECEITA_INTERNACAO
----------------------------
CREATE TABLE receita_internacao(
  Codigo_internacao INT NOT NULL,
  Codigo_medicamento INT NOT NULL,
  Data_hora TIMESTAMP NOT NULL,
  PRIMARY KEY (Codigo_internacao, Codigo_medicamento, Data_hora),
  FOREIGN KEY (Codigo_internacao) REFERENCES internacoes (Codigo),
  FOREIGN KEY (Codigo_medicamento) REFERENCES medicamentos (Codigo)
);
----------------------------
-- DDL EXAME_CONSULTA
----------------------------
CREATE TABLE exame_consulta(
  Codigo INT NOT NULL,
  Data_hora TIMESTAMP NOT NULL,
  Valor FLOAT NOT NULL,
  Resultado VARCHAR(45),
  Codigo_tipo_exame INT NOT NULL,
  Codigo_paciente INT NOT NULL,
  Codigo_convenio INT NOT NULL,
  Codigo_medico INT NOT NULL,
  Codigo_especialidade INT NOT NULL,
  Data_consulta TIMESTAMP NOT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_consulta
  ) REFERENCES consulta (
    Codigo_paciente,
    Codigo_convenio,
    Codigo_medico,
    Codigo_especialidade,
    Data_hora
  ),
  FOREIGN KEY (Codigo_tipo_exame) REFERENCES tipo_exame (Codigo)
);
----------------------------
-- DDL EXAME_INTERNACAO
----------------------------
CREATE TABLE exame_internacao(
  Codigo INT NOT NULL,
  Data_hora TIMESTAMP NOT NULL,
  Valor FLOAT NOT NULL,
  Resultado VARCHAR(45),
  Codigo_tipo_exame INT NOT NULL,
  Codigo_internacao INT NOT NULL,
  PRIMARY KEY (Codigo),
  FOREIGN KEY (Codigo_internacao) REFERENCES internacoes (Codigo),
  FOREIGN KEY (Codigo_tipo_exame) REFERENCES tipo_exame (Codigo)
);