CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO alunos (nome, turma, curso)
VALUES ('Ana Ferreira', '1A', 'Engenharia da Água'),
       ('Jeff Montenegro', '1A', 'Engenharia da Água'),
       ('Pedro Filho', '1A', 'Engenharia da Água'),
       ('Rebeca Lima', '1B', 'Engenharia das Alamedas'),
       ('Eduarda Duarte', '1B', 'Engenharia das Alamedas'),
       ('Fernanda Peçanha', '1B', 'Engenharia das Alamedas'),
       ('Thiago Schmidt', '1C', 'Administração das Redondezas'),
       ('Rodrigo Maciel', '1C', 'Administração das Redondezas'),
       ('Rafael Souza', '1C', 'Administração das Redondezas'),
       ('Breno Silva', '1C', 'Administração das Redondezas');

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia da Água', 5),
       ('Engenharia das Alamedas', 3),
       ('Administração das Redondezas', 4);

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 3);
    

SELECT * FROM alunos;

SELECT * FROM cursos;

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
