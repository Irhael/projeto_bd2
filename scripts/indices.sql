-- ÍNDICES

-- índice `Usuario` -> (email)
CREATE INDEX indice_usuario_email ON Usuario(email);

-- índice `Inscricao` -> (nome_canal)
CREATE INDEX indice_inscricao_nome_canal ON Inscricao(nome_canal);

-- índice `Doacao` -> (nome_canal, titulo_video, dataH_video)
CREATE INDEX indice_doacao_canal_video_data ON Doacao(nome_canal, titulo_video, dataH_video);

-- índice `Patrocinio` -> (nome_canal)
CREATE INDEX indice_patrocinio_nome_canal ON Patrocinio(nome_canal);
