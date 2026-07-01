-- Biblioteca-escolar
--Bancos de dados

CREATE TABLE Editora (
    id_editora SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE, 
    ano_publicacao INTEGER NOT NULL,
    edicao INTEGER NOT NULL,
    quantidade_exemplares INTEGER NOT NULL,
    id_editora INTEGER NOT NULL,

    CONSTRAINT fk_livro_editora
        FOREIGN KEY (id_editora)
        REFERENCES Editora(id_editora)
);


CREATE TABLE Autor (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
	ALTER TABLE Autor
ADD COLUMN nacionalidade VARCHAR(50);
);


CREATE TABLE livro_autor (
    id_livro INTEGER NOT NULL,
    id_autor INTEGER NOT NULL,

    PRIMARY KEY (id_livro, id_autor),

    CONSTRAINT fk_livro_autor_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro),

    CONSTRAINT fk_livro_autor_autor
        FOREIGN KEY (id_autor)
        REFERENCES Autor(id_autor)
);

CREATE TABLE usuarios (
    id_usuarios SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    e_mail VARCHAR(100) NOT NULL UNIQUE, 
    matricula VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL
	ALTER TABLE usuarios
ADD COLUMN tipo_usuario VARCHAR(20);
);


CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    data_retirada DATE NOT NULL,
    data_prevista DATE NOT NULL,
    id_usuario INTEGER NOT NULL,

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuarios)
);


CREATE TABLE emprestimo_livro (
    id_emprestimo INTEGER NOT NULL,
    id_livro INTEGER NOT NULL,

    PRIMARY KEY (id_emprestimo, id_livro),

    CONSTRAINT fk_emprestimo_livro_emprestimo
        FOREIGN KEY (id_emprestimo)
        REFERENCES emprestimo(id_emprestimo),

    CONSTRAINT fk_emprestimo_livro_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
);

CREATE TABLE usuarios_telefone (
    id_telefone SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    telefone VARCHAR(20) NOT NULL,

    CONSTRAINT fk_telefone_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuarios)
);   
--insert

-- EDITORA

INSERT INTO Editora (nome) VALUES
('Saraiva'),
('Atlas'),
('Pearson'),
('Novatec');


-- LIVROS

INSERT INTO livro
(titulo, isbn, ano_publicacao, edicao, quantidade_exemplares, id_editora)
VALUES
('Banco de Dados', '9788575220011', 2022, 3, 10, 1),
('Algoritmos', '9788575220028', 2021, 2, 8, 2),
('Engenharia de Software', '9788575220035', 2020, 5, 12, 3),
('Programação em Python', '9788575220042', 2023, 1, 15, 4);


-- AUTORES

INSERT INTO Autor (nome_autor) VALUES
('Carlos Silva'),
('Maria Oliveira'),
('João Souza'),
('Ana Pereira');

UPDATE Autor
SET nacionalidade = 'Brasileira'
WHERE id_autor = 5;

UPDATE Autor
SET nacionalidade = 'Portuguesa'
WHERE id_autor = 6;

UPDATE Autor
SET nacionalidade = 'Brasileira'
WHERE id_autor = 7;

UPDATE Autor
SET nacionalidade = 'Argentina'
WHERE id_autor = 8;


-- LIVRO_AUTOR

INSERT INTO livro_autor (id_livro, id_autor) VALUES
(5,5),
(6,6),
(7,7),
(8,8);


-- USUÁRIOS

INSERT INTO usuarios
(nome, e_mail, matricula, data_nascimento, rua, bairro, numero, cidade, cep)
VALUES
('Pedro Santos','pedro@email.com','2024001','2004-05-10',
'Rua das Flores','Centro','120','Campina Grande','58400-000'),

('Juliana Lima','juliana@email.com','2024002','2003-08-20',
'Rua João Pessoa','Liberdade','45','Campina Grande','58401-200'),

('Lucas Almeida','lucas@email.com','2024003','2005-02-15',
'Rua Tiradentes','Catolé','87','Campina Grande','58410-500');

UPDATE usuarios
SET tipo_usuario = 'Aluno'
WHERE id_usuarios = 1;

UPDATE usuarios
SET tipo_usuario = 'Professor'
WHERE id_usuarios = 2;

UPDATE usuarios
SET tipo_usuario = 'Aluno'
WHERE id_usuarios = 3;


-- TELEFONES

INSERT INTO usuarios_telefone (id_usuario, telefone) VALUES
(1,'(83)99999-1111'),
(1,'(83)98888-1111'),
(2,'(83)99999-2222'),
(3,'(83)99999-3333');


-- EMPRÉSTIMOS

INSERT INTO emprestimo
(data_retirada, data_prevista, id_usuario)
VALUES
('2025-03-01','2025-03-15',1),
('2025-03-05','2025-03-19',2),
('2025-03-10','2025-03-24',3);


-- EMPRÉSTIMO_LIVRO

INSERT INTO emprestimo_livro
(id_emprestimo, id_livro)
VALUES
(1,5),
(2,6),
(3,7),
(3,8);

--Select

SELECT * FROM Editora;
SELECT * FROM livro;
SELECT * FROM Autor;
SELECT * FROM livro_autor;
SELECT * FROM usuarios;
SELECT * FROM usuarios_telefone;
SELECT * FROM emprestimo; 
SELECT * FROM emprestimo_livro;

--Parte 1

SELECT * FROM livro;

SELECT titulo, isbn, ano_publicacao
FROM livro;

SELECT * FROM usuarios;

SELECT nome, matricula, e_mail
FROM usuarios;

SELECT * FROM Autor;

SELECT nome
FROM Editora;

-- Parte 2 

SELECT *
FROM livro
WHERE ano_publicacao = 2022;

SELECT *
FROM livro
WHERE quantidade_exemplares > 10;

SELECT *
FROM livro
WHERE quantidade_exemplares < 10;

SELECT *
FROM usuarios
WHERE tipo_usuario = 'Aluno';

SELECT *
FROM usuarios
WHERE cidade = 'Campina Grande';

SELECT *
FROM Autor
WHERE nacionalidade = 'Brasileira';

SELECT *
FROM Editora
WHERE nome = 'Saraiva';

SELECT *
FROM emprestimo
WHERE data_retirada = '2025-03-01';

