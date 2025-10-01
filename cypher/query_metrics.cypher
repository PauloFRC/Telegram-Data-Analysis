// MÉTRICAS DE COMPARTILHAMENTOS GERAL 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 5;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 5;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 5;

// MÉTRICAS DE COMPARTILHAMENTOS VIRAL 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 5;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 5;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 5;

// MÉTRICAS DE COMPARTILHAMENTOS COM DESINFORMAÇÃO 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 5;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 5;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 5;

// OUTRAS MÉTRICAS

// Usuários que mais enviaram mensagens
MATCH (u:User)-[:SENT]->(m:Mensagem)
RETURN u.id AS user, count(m) AS total_de_mensagens
ORDER BY total_de_mensagens DESC
LIMIT 5;

// Usuários mais conectados
MATCH (u:User)-[r:SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS total_de_conexoes
ORDER BY total_de_conexoes DESC
LIMIT 5;
