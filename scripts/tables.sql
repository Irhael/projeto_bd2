-- TABLES

CREATE TABLE Empresa (
    nro SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL
);

CREATE TABLE Conversao (
    moeda VARCHAR(3) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    fator_conver DECIMAL(10, 4) NOT NULL
);

CREATE TABLE Pais (
    ddi INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    moeda VARCHAR(3) REFERENCES Conversao(moeda)
);

CREATE TABLE Usuario (
    nick VARCHAR(50) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    data_nasc DATE NOT NULL,
    telefone VARCHAR(20),
    end_postal VARCHAR(255),
    pais_residencia INT REFERENCES Pais(ddi)
);

CREATE TABLE Plataforma (
    nro SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    qtd_users INT,
    empresa_fund INT REFERENCES Empresa(nro),
    empresa_respo INT REFERENCES Empresa(nro),
    data_fund DATE NOT NULL
);

CREATE TABLE PlataformaUsuario (
    nro_plataforma INT REFERENCES Plataforma(nro),
    nick_usuario VARCHAR(50) REFERENCES Usuario(nick),
    nro_usuario INT,
    PRIMARY KEY (nro_plataforma, nick_usuario)
);

CREATE TABLE StreamerPais (
    nick_streamer VARCHAR(50) REFERENCES Usuario(nick),
    ddi_pais INT REFERENCES Pais(ddi),
    nro_passaporte VARCHAR(50),
    PRIMARY KEY (nick_streamer, ddi_pais)
);

CREATE TABLE Canal (
    nome VARCHAR(255) PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL,
    data DATE NOT NULL,
    descricao TEXT,
    qtd_visualizacoes INT,
    nick_streamer VARCHAR(50) REFERENCES Usuario(nick),
    nro_plataforma INT REFERENCES Plataforma(nro)
);

CREATE TABLE Patrocinio (
    nro_empresa INT REFERENCES Empresa(nro),
    nome_canal VARCHAR(255) REFERENCES Canal(nome),
    valor DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (nro_empresa, nome_canal)
);

CREATE TABLE NivelCanal (
    nome_canal VARCHAR(255) REFERENCES Canal(nome),
    nivel INT,
    valor DECIMAL(10, 2) NOT NULL,
    gif BYTEA,
    PRIMARY KEY (nome_canal, nivel)
);

CREATE TABLE Inscricao (
    nome_canal VARCHAR(255) REFERENCES Canal(nome),
    nick_membro VARCHAR(50) REFERENCES Usuario(nick),
    nivel INT,
    PRIMARY KEY (nome_canal, nick_membro),
    FOREIGN KEY (nome_canal, nivel) REFERENCES NivelCanal(nome_canal, nivel)
);

CREATE TABLE Video (
    nome_canal VARCHAR(255) REFERENCES Canal(nome),
    titulo VARCHAR(255),
    dataH TIMESTAMP,
    tema VARCHAR(255),
    duracao INT,
    visu_simul INT,
    visu_total INT,
    PRIMARY KEY (nome_canal, titulo, dataH),
    CONSTRAINT unique_video UNIQUE (nome_canal, titulo, dataH)
);

CREATE TABLE Participa (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_streamer VARCHAR(50),
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_streamer),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video) REFERENCES Video(nome_canal, titulo, dataH),
    FOREIGN KEY (nick_streamer) REFERENCES Usuario(nick)
);

CREATE TABLE Comentario (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq INT,
    texto TEXT,
    dataH TIMESTAMP NOT NULL,
    coment_on BOOLEAN,
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video) REFERENCES Video(nome_canal, titulo, dataH),
    FOREIGN KEY (nick_usuario) REFERENCES Usuario(nick)
);

CREATE TABLE Doacao (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq_comentario INT,
    seq_pg INT,
    valor DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('recusado', 'recebido', 'lido')),
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario) REFERENCES Comentario(nome_canal, titulo_video, dataH_video, nick_usuario, seq)
);

CREATE TABLE BitCoin (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq_comentario INT,
    seq_doacao INT,
    TxID VARCHAR(64),
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao) REFERENCES Doacao(nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg)
);

CREATE TABLE PayPal (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq_comentario INT,
    seq_doacao INT,
    IdPayPal VARCHAR(64),
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao) REFERENCES Doacao(nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg)
);

CREATE TABLE CartaoCredito (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq_comentario INT,
    seq_doacao INT,
    nro VARCHAR(16),
    bandeira VARCHAR(20),
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao) REFERENCES Doacao(nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg)
);

CREATE TABLE MecanismoPlat (
    nome_canal VARCHAR(255),
    titulo_video VARCHAR(255),
    dataH_video TIMESTAMP,
    nick_usuario VARCHAR(50),
    seq_comentario INT,
    seq_doacao INT,
    seq_plataforma INT,
    PRIMARY KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao),
    FOREIGN KEY (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao) REFERENCES Doacao(nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg)
);
