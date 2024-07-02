-- PROCEDURES


-- Procedure 1: Identificar quais são os canais patrocinados e os valores de patrocínio pagos por empresa. Dar a opção de filtrar os resultados por empresa como um parâmetro opcional na forma de uma stored procedure.

CREATE OR REPLACE FUNCTION procedure_canais_patrocinados_por_empresa(p_empresa_nome VARCHAR DEFAULT NULL)
RETURNS TABLE(empresa_nome VARCHAR, canal VARCHAR, valor DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT v.empresa AS empresa_nome, v.canal, v.valor
    FROM view_patrocinios_por_empresa v
    WHERE p_empresa_nome IS NULL OR v.empresa = p_empresa_nome;
END;
$$ LANGUAGE plpgsql;


-- Procedure 2: Descobrir de quantos canais cada usuário é membro e a soma do valor desembolsado por usuário por mês. Dar a opção de filtrar os resultados por usuário como um parâmetro opcional na forma de uma stored procedure.

CREATE OR REPLACE FUNCTION procedure_quantidade_canais_valor_usuario(p_nick_usuario VARCHAR DEFAULT NULL)
RETURNS TABLE(nick VARCHAR, quantidade_canais BIGINT, valor_total DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT u.nick, COUNT(i.nome_canal) AS quantidade_canais, SUM(nc.valor) AS valor_total
    FROM Usuario u
    JOIN Inscricao i ON u.nick = i.nick_membro
    JOIN NivelCanal nc ON i.nome_canal = nc.nome_canal AND i.nivel = nc.nivel
    WHERE p_nick_usuario IS NULL OR u.nick = p_nick_usuario
    GROUP BY u.nick;
END;
$$ LANGUAGE plpgsql;


-- Procedure 3: Listar e ordenar os canais que já receberam doações e a soma dos valores recebidos em doação. Dar a opção de filtrar os resultados por canal como um parâmetro opcional na forma de uma stored procedure.

CREATE OR REPLACE FUNCTION procedure_doacoes_canais(p_nome_canal VARCHAR DEFAULT NULL)
RETURNS TABLE(canal_nome VARCHAR, total_doacoes DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT v.canal AS canal_nome, v.total_doacoes
    FROM view_doacoes_por_canal v
    WHERE p_nome_canal IS NULL OR v.canal = p_nome_canal;
END;
$$ LANGUAGE plpgsql;


-- Procedure 4: Listar a soma das doações geradas pelos comentários que foram lidos por vídeo. Dar aopção de filtrar os resultados por vídeo como um parâmetro opcional na forma de uma stored procedure.

CREATE OR REPLACE FUNCTION procedure_soma_doacoes_per_video(p_titulo_video VARCHAR DEFAULT NULL, p_dataH_video TIMESTAMP DEFAULT NULL)
RETURNS TABLE(titulo_video VARCHAR, dataH_video TIMESTAMP, total_doacoes DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT v.titulo AS titulo_video, v.dataH AS dataH_video, SUM(d.valor) AS total_doacoes
    FROM Doacao d
    JOIN Comentario com ON d.nome_canal = com.nome_canal AND d.titulo_video = com.titulo_video AND d.dataH_video = com.dataH_video AND d.nick_usuario = com.nick_usuario AND d.seq_comentario = com.seq
    JOIN Video v ON com.nome_canal = v.nome_canal AND com.titulo_video = v.titulo AND com.dataH_video = v.dataH
    WHERE com.coment_on = TRUE AND (p_titulo_video IS NULL OR v.titulo = p_titulo_video) AND (p_dataH_video IS NULL OR v.dataH = p_dataH_video)
    GROUP BY v.titulo, v.dataH;
END;
$$ LANGUAGE plpgsql;


-- Procedure 5: Listar e ordenar os k canais que mais recebem aportes de membros e os valores recebidos.

CREATE OR REPLACE FUNCTION procedure_top_canais_per_patrocinio(k INT)
RETURNS TABLE(canal VARCHAR, total_patrocinio DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nome AS canal, SUM(p.valor) AS total_patrocinio
    FROM Patrocinio p
    JOIN Canal c ON p.nome_canal = c.nome
    GROUP BY c.nome
    ORDER BY total_patrocinio DESC
    LIMIT k;
END;
$$ LANGUAGE plpgsql;


-- Procedure 6: Listar e ordenar os k canais que mais recebem aportes de membros e os valores recebidos.

CREATE OR REPLACE FUNCTION procedure_top_canais_per_aporte_membros(k INT)
RETURNS TABLE(canal VARCHAR, total_aporte DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nome AS canal, SUM(nc.valor) AS total_aporte
    FROM Inscricao i
    JOIN NivelCanal nc ON i.nome_canal = nc.nome_canal AND i.nivel = nc.nivel
    JOIN Canal c ON i.nome_canal = c.nome
    GROUP BY c.nome
    ORDER BY total_aporte DESC
    LIMIT k;
END;
$$ LANGUAGE plpgsql;


-- Procedure 7: Listar e ordenar os k canais que mais receberam doações considerando todos os vídeos.

CREATE OR REPLACE FUNCTION procedure_top_canais_per_doacoes(k INT)
RETURNS TABLE(canal VARCHAR, total_doacoes DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nome AS canal, SUM(d.valor) AS total_doacoes
    FROM Doacao d
    JOIN Canal c ON d.nome_canal = c.nome
    GROUP BY c.nome
    ORDER BY total_doacoes DESC
    LIMIT k;
END;
$$ LANGUAGE plpgsql;


-- Procedure 8: Listar os k canais que mais faturam considerando as três fontes de receita: patrocínio, membros inscritos e doações.

CREATE OR REPLACE FUNCTION procedure_top_canais_per_faturamento(k INT)
RETURNS TABLE(canal VARCHAR, total_faturamento DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nome AS canal, 
           COALESCE(SUM(DISTINCT p.valor), 0) + 
           COALESCE(SUM(DISTINCT i.valor_inscricao), 0) + 
           COALESCE(SUM(DISTINCT d.valor_doacao), 0) AS total_faturamento
    FROM Canal c
    LEFT JOIN (
        SELECT nome_canal, SUM(valor) AS valor
        FROM Patrocinio
        GROUP BY nome_canal
    ) p ON c.nome = p.nome_canal
    LEFT JOIN (
        SELECT i.nome_canal, SUM(nc.valor) AS valor_inscricao
        FROM Inscricao i
        JOIN NivelCanal nc ON i.nome_canal = nc.nome_canal AND i.nivel = nc.nivel
        GROUP BY i.nome_canal
    ) i ON c.nome = i.nome_canal
    LEFT JOIN (
        SELECT nome_canal, SUM(valor) AS valor_doacao
        FROM Doacao
        GROUP BY nome_canal
    ) d ON c.nome = d.nome_canal
    GROUP BY c.nome
    ORDER BY total_faturamento DESC
    LIMIT k;
END;
$$ LANGUAGE plpgsql;
