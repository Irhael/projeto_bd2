-- DATA


INSERT INTO Empresa (nome, nome_fantasia) VALUES 
('Google', 'Google Inc.'),
('Amazon', 'Amazon.com, Inc.'),
('Microsoft', 'Microsoft Corporation'),
('Facebook', 'Facebook, Inc.'),
('Netflix', 'Netflix, Inc.'),
('Twitch', 'Twitch Interactive, Inc.'),
('Valve', 'Valve Corporation'),
('Sony', 'Sony Interactive Entertainment'),
('Nintendo', 'Nintendo Co., Ltd.'),
('Tencent', 'Tencent Holdings Ltd.');


INSERT INTO Conversao (moeda, nome, fator_conver) VALUES 
('USD', 'Dollar', 1.00),
('EUR', 'Euro', 1.10),
('JPY', 'Yen', 0.0091),
('GBP', 'Pound', 1.25),
('AUD', 'Australian Dollar', 0.70),
('CAD', 'Canadian Dollar', 0.75),
('CHF', 'Swiss Franc', 1.05),
('CNY', 'Yuan', 0.15),
('INR', 'Rupee', 0.013),
('BRL', 'Real', 0.20);


INSERT INTO Pais (ddi, nome, moeda) VALUES 
(1, 'United States', 'USD'),
(49, 'Germany', 'EUR'),
(81, 'Japan', 'JPY'),
(44, 'United Kingdom', 'GBP'),
(61, 'Australia', 'AUD'),
(1, 'Canada', 'CAD'),
(41, 'Switzerland', 'CHF'),
(86, 'China', 'CNY'),
(91, 'India', 'INR'),
(55, 'Brazil', 'BRL');


INSERT INTO Usuario (nick, email, data_nasc, telefone, end_postal, pais_residencia) VALUES 
('user1', 'user1@example.com', '1990-01-01', '555-1234', '123 Main St', 1),
('user2', 'user2@example.com', '1991-02-02', '555-5678', '456 Oak St', 49),
('user3', 'user3@example.com', '1992-03-03', '555-9101', '789 Pine St', 81),
('user4', 'user4@example.com', '1993-04-04', '555-1122', '101 Maple St', 44),
('user5', 'user5@example.com', '1994-05-05', '555-3344', '202 Birch St', 61),
('user6', 'user6@example.com', '1995-06-06', '555-5566', '303 Cedar St', 1),
('user7', 'user7@example.com', '1996-07-07', '555-7788', '404 Elm St', 41),
('user8', 'user8@example.com', '1997-08-08', '555-9900', '505 Spruce St', 86),
('user9', 'user9@example.com', '1998-09-09', '555-2233', '606 Willow St', 91),
('user10', 'user10@example.com', '1999-10-10', '555-4455', '707 Chestnut St', 55);


INSERT INTO Plataforma (nome, qtd_users, empresa_fund, empresa_respo, data_fund) VALUES 
('YouTube', 2000000000, 1, 1, '2005-02-14'),
('Twitch', 150000000, 6, 6, '2011-06-06'),
('Mixer', 50000000, 3, 3, '2016-01-05'),
('Facebook Gaming', 300000000, 4, 4, '2018-06-01'),
('DLive', 10000000, 2, 2, '2017-12-20'),
('Caffeine', 5000000, 7, 7, '2018-01-01'),
('Huya', 20000000, 9, 9, '2016-11-01'),
('Nimo TV', 15000000, 10, 10, '2016-10-01'),
('Smashcast', 5000000, 8, 8, '2017-03-20'),
('Trovo', 10000000, 5, 5, '2020-07-01');


INSERT INTO PlataformaUsuario (nro_plataforma, nick_usuario, nro_usuario) VALUES 
(1, 'user1', 101),
(1, 'user2', 102),
(2, 'user3', 201),
(2, 'user4', 202),
(3, 'user5', 301),
(3, 'user6', 302),
(4, 'user7', 401),
(4, 'user8', 402),
(5, 'user9', 501),
(5, 'user10', 502);


INSERT INTO StreamerPais (nick_streamer, ddi_pais, nro_passaporte) VALUES 
('user1', 1, 'A1234567'),
('user2', 49, 'B1234567'),
('user3', 81, 'C1234567'),
('user4', 44, 'D1234567'),
('user5', 61, 'E1234567'),
('user6', 1, 'F1234567'),
('user7', 41, 'G1234567'),
('user8', 86, 'H1234567'),
('user9', 91, 'I1234567'),
('user10', 55, 'J1234567');


INSERT INTO Canal (nome, tipo, data, descricao, qtd_visualizacoes, nick_streamer, nro_plataforma) VALUES 
('CanalA', 'publico', '2020-01-01', 'Descrição do Canal A', 100000, 'user1', 1),
('CanalB', 'privado', '2020-02-01', 'Descrição do Canal B', 200000, 'user2', 2),
('CanalC', 'misto', '2020-03-01', 'Descrição do Canal C', 300000, 'user3', 3),
('CanalD', 'publico', '2020-04-01', 'Descrição do Canal D', 400000, 'user4', 4),
('CanalE', 'privado', '2020-05-01', 'Descrição do Canal E', 500000, 'user5', 5),
('CanalF', 'misto', '2020-06-01', 'Descrição do Canal F', 600000, 'user6', 1),
('CanalG', 'publico', '2020-07-01', 'Descrição do Canal G', 700000, 'user7', 2),
('CanalH', 'privado', '2020-08-01', 'Descrição do Canal H', 800000, 'user8', 3),
('CanalI', 'misto', '2020-09-01', 'Descrição do Canal I', 900000, 'user9', 4),
('CanalJ', 'publico', '2020-10-01', 'Descrição do Canal J', 1000000, 'user10', 5);


INSERT INTO Patrocinio (nro_empresa, nome_canal, valor) VALUES 
(1, 'CanalA', 1000.00),
(2, 'CanalB', 2000.00),
(3, 'CanalC', 3000.00),
(4, 'CanalD', 4000.00),
(5, 'CanalE', 5000.00),
(6, 'CanalF', 6000.00),
(7, 'CanalG', 7000.00),
(8, 'CanalH', 8000.00),
(9, 'CanalI', 9000.00),
(10, 'CanalJ', 10000.00);


INSERT INTO NivelCanal (nome_canal, nivel, valor, gif) VALUES 
('CanalA', 1, 5.00, NULL),
('CanalA', 2, 10.00, NULL),
('CanalA', 3, 15.00, NULL),
('CanalA', 4, 20.00, NULL),
('CanalA', 5, 25.00, NULL),
('CanalB', 1, 5.00, NULL),
('CanalB', 2, 10.00, NULL),
('CanalB', 3, 15.00, NULL),
('CanalB', 4, 20.00, NULL),
('CanalB', 5, 25.00, NULL),
('CanalC', 1, 5.00, NULL),
('CanalC', 2, 10.00, NULL),
('CanalD', 3, 15.00, NULL),
('CanalD', 4, 20.00, NULL),
('CanalE', 5, 25.00, NULL),
('CanalF', 1, 5.00, NULL),
('CanalG', 2, 10.00, NULL),
('CanalH', 3, 15.00, NULL),
('CanalI', 4, 20.00, NULL),
('CanalJ', 5, 25.00, NULL);


INSERT INTO Inscricao (nome_canal, nick_membro, nivel) VALUES 
('CanalA', 'user1', 1),
('CanalA', 'user2', 2),
('CanalA', 'user3', 3),
('CanalA', 'user4', 4),
('CanalA', 'user5', 5),
('CanalB', 'user6', 1),
('CanalB', 'user7', 2),
('CanalB', 'user8', 3),
('CanalB', 'user9', 4),
('CanalB', 'user10', 5),
('CanalC', 'user1', 1),
('CanalC', 'user2', 2),
('CanalD', 'user3', 3),
('CanalD', 'user4', 4),
('CanalE', 'user5', 5),
('CanalF', 'user6', 1),
('CanalG', 'user7', 2),
('CanalH', 'user8', 3),
('CanalI', 'user9', 4),
('CanalJ', 'user10', 5);


INSERT INTO Video (nome_canal, titulo, dataH, tema, duracao, visu_simul, visu_total) VALUES 
('CanalA', 'Video1', '2020-01-01 10:00:00', 'Tema1', 60, 1000, 10000),
('CanalA', 'Video2', '2020-01-02 10:00:00', 'Tema2', 60, 2000, 20000),
('CanalA', 'Video3', '2020-01-03 10:00:00', 'Tema3', 60, 3000, 30000),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'Tema1', 60, 4000, 40000),
('CanalB', 'Video2', '2020-02-02 10:00:00', 'Tema2', 60, 5000, 50000),
('CanalB', 'Video3', '2020-02-03 10:00:00', 'Tema3', 60, 6000, 60000),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'Tema1', 60, 7000, 70000),
('CanalC', 'Video2', '2020-03-02 10:00:00', 'Tema2', 60, 8000, 80000),
('CanalC', 'Video3', '2020-03-03 10:00:00', 'Tema3', 60, 9000, 90000),
('CanalD', 'Video1', '2020-04-01 10:00:00', 'Tema1', 60, 10000, 100000);


INSERT INTO Participa (nome_canal, titulo_video, dataH_video, nick_streamer) VALUES 
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user1'),
('CanalA', 'Video2', '2020-01-02 10:00:00', 'user2'),
('CanalA', 'Video3', '2020-01-03 10:00:00', 'user3'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user4'),
('CanalB', 'Video2', '2020-02-02 10:00:00', 'user5'),
('CanalB', 'Video3', '2020-02-03 10:00:00', 'user6'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user7'),
('CanalC', 'Video2', '2020-03-02 10:00:00', 'user8'),
('CanalC', 'Video3', '2020-03-03 10:00:00', 'user9'),
('CanalD', 'Video1', '2020-04-01 10:00:00', 'user10');


INSERT INTO Comentario (nome_canal, titulo_video, dataH_video, nick_usuario, seq, texto, dataH, coment_on) VALUES 
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user1', 1, 'Comentário 1', '2020-01-01 10:01:00', TRUE),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user2', 2, 'Comentário 2', '2020-01-01 10:02:00', TRUE),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user3', 3, 'Comentário 3', '2020-01-01 10:03:00', TRUE),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user4', 1, 'Comentário 1', '2020-02-01 10:01:00', TRUE),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user5', 2, 'Comentário 2', '2020-02-01 10:02:00', TRUE),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user6', 3, 'Comentário 3', '2020-02-01 10:03:00', TRUE),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user7', 1, 'Comentário 1', '2020-03-01 10:01:00', TRUE),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user8', 2, 'Comentário 2', '2020-03-01 10:02:00', TRUE),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user9', 3, 'Comentário 3', '2020-03-01 10:03:00', TRUE),
('CanalD', 'Video1', '2020-04-01 10:00:00', 'user10', 1, 'Comentário 1', '2020-04-01 10:01:00', TRUE);


INSERT INTO Doacao (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_pg, valor, status) VALUES 
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user1', 1, 1, 10.00, 'recebido'),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user2', 2, 2, 20.00, 'recebido'),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user3', 3, 3, 30.00, 'recebido'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user4', 1, 1, 40.00, 'recebido'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user5', 2, 2, 50.00, 'recebido'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user6', 3, 3, 60.00, 'recebido'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user7', 1, 1, 70.00, 'recebido'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user8', 2, 2, 80.00, 'recebido'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user9', 3, 3, 90.00, 'recebido'),
('CanalD', 'Video1', '2020-04-01 10:00:00', 'user10', 1, 1, 100.00, 'recebido');


INSERT INTO BitCoin (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao, TxID) VALUES 
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user1', 1, 1, 'TxID1'),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user2', 2, 2, 'TxID2'),
('CanalA', 'Video1', '2020-01-01 10:00:00', 'user3', 3, 3, 'TxID3');

-- Dados para PayPal
INSERT INTO PayPal (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao, IdPayPal) VALUES 
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user4', 1, 1, 'IdPayPal1'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user5', 2, 2, 'IdPayPal2'),
('CanalB', 'Video1', '2020-02-01 10:00:00', 'user6', 3, 3, 'IdPayPal3');


INSERT INTO CartaoCredito (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao, nro, bandeira) VALUES 
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user7', 1, 1, '4111111111111111', 'Visa'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user8', 2, 2, '4222222222222222', 'MasterCard'),
('CanalC', 'Video1', '2020-03-01 10:00:00', 'user9', 3, 3, '4333333333333333', 'Amex');


INSERT INTO MecanismoPlat (nome_canal, titulo_video, dataH_video, nick_usuario, seq_comentario, seq_doacao, seq_plataforma) VALUES 
('CanalD', 'Video1', '2020-04-01 10:00:00', 'user10', 1, 1, 1),

