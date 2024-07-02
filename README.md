# Projeto de Banco de Dados II

Este projeto contém a implementação de um banco de dados relacional para catalogar informações sobre streamers.

## Estrutura do Projeto

- scripts/
  - `tables.sql`: Criação das tabelas do banco de dados.
  - `data.sql`: Inserção de dados de exemplo.
  - `views.sql`: Criação das views.
  - `triggers.sql`: Criação dos triggers.
  - `procedures.sql`: Criação das stored procedures.
  - `indices.sql`: Criação dos índices.


## Instruções  passo-a-passo de Configuração

1. **Inicie o container Docker com PostgreSQL:**
   ```sh
   docker pull postgres
   docker run --name nome_db -e POSTGRES_PASSWORD=abcd1234 -d postgres

2. **Conecte-se ao Postgre**
   ```sh
   docker exec -it nome_db psql -U postgres

3. **Crie o banco de dados**
   ```sh
   CREATE DATABASE streamers_bd;
   \c streamers_bd

4. **Execute os scripts, nessa ordem, para criar as tabelas**
   ```sh
   \i /caminho/scripts/tables.sql
   \i /caminho/scripts/data.sql
   \i /caminho/scripts/views.sql
   \i /caminho/scripts/triggers.sql
   \i /caminho/scripts/procedures.sql
   \i /caminho//scripts/indices.sql

5. **Testar as stored procedures**
   ```sh
   Procedure 1:
   Sem filtro:
   SELECT * FROM sp_canais_patrocinados_por_empresa();
   Com filtro:
   SELECT * FROM sp_canais_patrocinados_por_empresa('Google');
   
   Procedure 2:
   Sem filtro:
   SELECT * FROM sp_quantidade_canais_valor_usuario();
   Com filtro:
   SELECT * FROM sp_quantidade_canais_valor_usuario('user1');
   
   Procedure 3:
   Sem filtro:
   SELECT * FROM sp_canais_que_receberam_doacoes();
   Com filtro:
   SELECT * FROM sp_canais_que_receberam_doacoes('CanalA');
    
   Procedure 4:
   Sem filtro:
   SELECT * FROM sp_soma_doacoes_por_video();
   Com filtro:
   SELECT * FROM sp_soma_doacoes_por_video('Video1', '2020-01-01 10:00:00');
    
   Procedure 5:
   SELECT * FROM sp_top_canais_por_patrocinio(5);
  
   Procedure 6:
   SELECT * FROM sp_top_canais_por_aporte_membros(5);
    
   Procedure 7:
   SELECT * FROM sp_top_canais_por_doacoes(5);
    
   Procedure 8:
   SELECT * FROM sp_top_canais_por_faturamento(5);


 **Relatório:**
*Escolhas de Implementação*

**Views** -> As views foram criadas para simplificar consultas complexas. As views materializadas foram utilizadas para armazenar resultados de consultas que são pesadas e frequentemente acessadas, como a soma de doações por canal.

**Views Virtuais:**

*view_patrocinios_por_empresa()* -> Esta view foi criada para facilitar a consulta de informações sobre os patrocínios, agrupando os dados de empresas e canais patrocinados, junto com os valores dos patrocínios.
Assim simplificando as consultas frequentes que envolvem a junção de várias tabelas para obter essas informações, permitindo uma visualização mais direta e rápida.

*view_doacoes_por_canal()* -> Esta view consolida as informações sobre as doações recebidas por cada canal, somando os valores das doações, facilita o acesso rápido a dados agregados sobre doações, eliminando a necessidade de escrever 
consultas complexas repetidamente.

**Views Materializadas:**

*mview_top_canais_por_doacoes()* -> Armazena os canais que mais receberam doações, juntamente com o total dessas doações. Foi criada para melhorar o desempenho ao consultar frequentemente os canais que mais receberam doações, já que os dados são pré-calculados e armazenados.

*mview_top_canais_por_doacoes()* -> Armazena os canais que mais receberam patrocínios, juntamente com o total desses patrocínios. Foi criada para otimizar o desempenho de consultas frequentes relacionadas aos canais mais patrocinados, uma vez que os dados são pré-agregados e armazenados.


**Índices**

*indice_usuario_email ON Usuario(email)* -> Índice criado na coluna email da tabela Usuario para melhorar, significativamente, a velocidade de consultas que filtram ou procuram usuários com base no email.

*indice_inscricao_nome_canal ON Inscricao(nome_canal)* -> Índice criado na coluna nome_canal da tabela Inscricao para otimizar a performance de consultas que envolvem a tabela Inscricao, especialmente aquelas que agregam ou filtram dados por canal.

*indice_doacao_canal_video_data ON Doacao(nome_canal, titulo_video, dataH_video)* -> Índice criado nas colunas nome_canal, titulo_video e dataH_video da tabela Doacao para aumentar a eficiência de consultas detalhadas que procuram doações relacionadas a vídeos específicos de determinados canais.

*indice_patrocinio_nome_canal ON Patrocinio(nome_canal)* -> Índice criado na coluna nome_canal da tabela Patrocinio para melhorar a velocidade de consultas que envolvem dados de patrocínios, facilitando o acesso rápido a informações sobre patrocínios de canais específicos.


**Triggers** 

*trg_atualizar_qtd_users()* -> Criado para atualizar automaticamente a contagem de usuários (qtd_users) na tabela Plataforma sempre que um novo usuário é adicionado a uma plataforma. Esse trigger assegura que a contagem de usuários esteja sempre atualizada, mantendo a integridade dos dados sem necessidade de operações manuais ou consultas adicionais.


