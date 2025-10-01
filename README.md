# Análise de Mensagens do Telegram com Neo4j

Paulo Ricardo Fernandes Rodrigues

Link do dataset: https://drive.google.com/file/d/1c_hLzk85pYw-huHSnFYZM_gn-dUsYRDm/view?usp=sharing

Instruções:

1. Colocar arquivo csv dentro de uma pasta data/
2. Executar scripts em viz_and_cleaning.ipynb
3. Mover telegram_tratado.csv para pasta import/ do neo4j
4. Conectar ao banco de dados neo4j (ex: usando plugin do VSCode)
5. Rodar load_db_from_csv.cypher para carregar dados para o banco
6. Rodar query_metrics.cypher para executar queries
