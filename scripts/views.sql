-- VIEWS

-- Virtuais
CREATE VIEW view_patrocinios_por_empresa AS
SELECT e.nome AS empresa, c.nome AS canal, p.valor
FROM Patrocinio p
JOIN Empresa e ON p.nro_empresa = e.nro
JOIN Canal c ON p.nome_canal = c.nome;

CREATE VIEW view_doacoes_por_canal AS
SELECT c.nome AS canal, SUM(d.valor) AS total_doacoes
FROM Doacao d
JOIN Comentario com ON d.nome_canal = com.nome_canal AND d.titulo_video = com.titulo_video AND d.dataH_video = com.dataH_video AND d.nick_usuario = com.nick_usuario AND d.seq_comentario = com.seq
JOIN Canal c ON com.nome_canal = c.nome
GROUP BY c.nome;

-- Materializadas
CREATE MATERIALIZED VIEW mview_top_canais_por_doacoes AS
SELECT c.nome AS canal, SUM(d.valor) AS total_doacoes
FROM Doacao d
JOIN Comentario com ON d.nome_canal = com.nome_canal AND d.titulo_video = com.titulo_video AND d.dataH_video = com.dataH_video AND d.nick_usuario = com.nick_usuario AND d.seq_comentario = com.seq
JOIN Canal c ON com.nome_canal = c.nome
GROUP BY c.nome
ORDER BY total_doacoes DESC;

CREATE MATERIALIZED VIEW mview_top_canais_por_patrocinios AS
SELECT c.nome AS canal, SUM(p.valor) AS total_patrocinios
FROM Patrocinio p
JOIN Canal c ON p.nome_canal = c.nome
GROUP BY c.nome
ORDER BY total_patrocinios DESC;
