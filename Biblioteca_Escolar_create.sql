

   CREATE TABLE Editora (
    id_editora SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL,
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
    nome_autor VARCHAR(100) NOT NULL,
    id_livro INTEGER NOT NULL,

    CONSTRAINT fk_autor_livro
        FOREIGN KEY (id_livro)
        REFERENCES livro(id_livro)
);

CREATE TABLE usuarios (
    id_usuarios SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    e_mail VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL
);

CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    data_retirada DATE NOT NULL,
    data_prevista DATE NOT NULL,
    id_usuario INTEGER NOT NULL,
    id_livro INTEGER NOT NULL,

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuarios),

    CONSTRAINT fk_emprestimo_livro
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