// MÉTRICAS DE COMPARTILHAMENTOS GERAL 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 20;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 20;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 20;

// MÉTRICAS DE COMPARTILHAMENTOS VIRAL 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 20;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 20;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 20;

// MÉTRICAS DE COMPARTILHAMENTOS COM DESINFORMAÇÃO 

// Centralidade geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_geral
ORDER BY grau_centralidade_geral DESC
LIMIT 20;

// Força geral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_geral
ORDER BY forca_geral DESC
LIMIT 20;

// Centralidade Viral
MATCH (u:User)
OPTIONAL MATCH (u)-[r:SHARES_MISINFORMATION]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS grau_centralidade_viral
ORDER BY grau_centralidade_viral DESC
LIMIT 20;

// USUÁRIOS MAIS RELEVANTES

// Usuários mais ativos (mais enviaram mensagens)
MATCH (u:User)-[:SENT]->(m:Mensagem)
RETURN u.id AS user, count(m) AS total_de_mensagens
ORDER BY total_de_mensagens DESC
LIMIT 5;

// Usuários que mais espalham desinformação
MATCH (u:User)-[:SENT]->(m:Mensagem)
WHERE m.score_misinformation > 0.8
RETURN u.id AS user, count(m) AS mensagens_de_desinformacao
ORDER BY mensagens_de_desinformacao DESC
LIMIT 5;

// Usuários mais influentes (que mais espalham mensagens virais)
MATCH (u:User)-[r:VIRAL_SHARES]-(neighbor)
RETURN u.id AS user, sum(r.weight) AS forca_viral
ORDER BY forca_viral DESC
LIMIT 5;

// Usuários mais conectados
MATCH (u:User)-[r:SHARES]-(neighbor)
RETURN u.id AS user, count(DISTINCT neighbor) AS total_de_conexoes
ORDER BY total_de_conexoes DESC
LIMIT 5;
