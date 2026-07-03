-- ==============================================================================
-- CAMADA BRONZE (RAW) - Ingestão de Dados com Problemas Reais
-- ==============================================================================

CREATE TABLE bronze_vendas (
    id_transacao INT,
    id_cliente INT,
    data_compra VARCHAR(20),
    produto VARCHAR(50),          
    valor_venda VARCHAR(50),
    status_pagamento VARCHAR(30),
    idade_cliente INT,
    estado_cliente VARCHAR(5)
);

INSERT INTO bronze_vendas VALUES 
(1, 101, '2023-10-01', 'Notebook', 'R$ 4.500,00', '  Aprovado  ', 35, 'SP'),
(2, 102, '2023-10-02', 'Smartphone ', 'R$ 2.100,50', 'aprovado', -5, 'rj'),
(3, 103, '2023-10-03', '  Teclado Mecanico', '350,00', 'CANCELADO', 999, NULL),
(4, 104, '2023-10-04', 'Monitor 27', 'R$ 1.250,75', ' Aprovado', 28, 'MG '),
(1, 101, '2023-10-01', 'Notebook', 'R$ 4.500,00', '  Aprovado  ', 35, 'SP'), -- DUPLICIDADE DA LINHA 1
(5, 105, '2023-10-05', 'Mouse sem fio', ' 120,00 ', 'Pendente', 17, 'BA'),
(6, 101, '2023-10-06', 'Monitor 27', 'R$ 1.250,00', 'Aprovado', 35, 'SP'),    -- Cliente 101 comprando de novo
(7, 102, '2023-10-07', 'Cadeira Gamer', '1.800,90', ' APROVADO ', NULL, 'RJ'),  -- Cliente 102 comprando de novo
(8, 106, '2023-10-08', 'Mesa de Escritorio', 'R$ 900,00', 'cancelado', 42, 'rs'),
(9, 107, '2023-10-09', 'Notebook', 'R$ 4.700,00', 'Aprovado', 105, 'SC'),
(10, 103, '2023-10-10', 'Mouse sem fio', '120,00', 'aprovado', 999, NULL),      -- Cliente 103 comprando de novo
(11, 104, '2023-10-11', 'Teclado Mecanico', 'R$ 350,00', 'Aprovado', 28, 'MG'), -- Cliente 104 comprando de novo
(12, 108, '2023-10-12', 'Smartphone', 'R$ 2.100,00', 'Pendente', 23, '  '),   -- Estado em branco
(13, 101, '2023-10-13', 'Cabo HDMI', ' 45,50', 'Aprovado', 35, 'SP'),           -- Cliente 101 na 3ª compra
(14, 109, '2023-10-14', 'Cadeira Gamer', 'R$ 1.950,00', ' cancelado ', 31, 'PE');


-- ==============================================================================
-- CAMADA SILVER (CLEAN) - Regras de Qualidade de Dados
-- ==============================================================================

CREATE VIEW silver_vendas AS
SELECT DISTINCT -- Remove a transação duplicada do cliente 101
    id_transacao,
    id_cliente,
    
    -- Converte a data para o tipo correto
    CAST(data_compra AS DATE) AS data_compra,
    
    -- Limpa o texto do produto
    UPPER(TRIM(produto)) AS produto,
    
    -- Limpeza Financeira: Tira o R$, remove o ponto de milhar, troca vírgula por ponto e converte
    CAST(
        REPLACE(
            REPLACE(
                REPLACE(valor_venda, 'R$ ', ''), 
            '.', ''), 
        ',', '.') 
    AS DECIMAL(10,2)) AS valor_limpo,
    
    -- Padroniza o status
    UPPER(TRIM(status_pagamento)) AS status_pagamento,
    
    -- Trata idades impossíveis usando uma média estática de 30 para preenchimento
    COALESCE(
        CASE 
            WHEN idade_cliente < 18 OR idade_cliente > 100 THEN NULL 
            ELSE idade_cliente 
        END, 
    30) AS idade_cliente,
    
    -- Trata estados nulos ou em branco
    CASE 
        WHEN TRIM(estado_cliente) = '' OR estado_cliente IS NULL THEN 'ND' 
        ELSE UPPER(TRIM(estado_cliente)) 
    END AS estado_cliente

FROM bronze_vendas;


-- ==============================================================================
-- CAMADA GOLD (ANALYTICS) - Feature Store para o Modelo
-- ==============================================================================

CREATE TABLE gold_perfil_clientes AS
SELECT 
    id_cliente,
    MAX(idade_cliente) AS idade,                      -- Como a idade não muda neste dataset, pegamos a máxima
    MAX(estado_cliente) AS uf_principal,              -- Estado onde o cliente mais compra
    COUNT(id_transacao) AS frequencia_compras,        -- Número total de pedidos com sucesso
    COUNT(DISTINCT produto) AS qtd_produtos_distintos,-- Diversidade do carrinho
    SUM(valor_limpo) AS total_gasto,                  -- Faturamento (LTV)
    AVG(valor_limpo) AS ticket_medio,                 -- Média gasta por transação
    MAX(data_compra) AS data_ultima_compra            -- Recência (quando foi a última compra?)
FROM silver_vendas
WHERE status_pagamento = 'APROVADO' -- Algoritmo só quer clientes que geraram receita
GROUP BY 
    id_cliente
ORDER BY 
    total_gasto DESC; -- Ordena os clientes VIPs no topo


-- ==============================================================================
-- QUERIES PARA DEMONSTRAÇÃO EM AULA
-- ==============================================================================
-- Descomente uma de cada vez na aula para mostrar a evolução:

-- 1. "Vejam o caos que vem do sistema original:"
-- SELECT * FROM bronze_vendas;

-- 2. "Vejam o poder da Engenharia de Dados (tipos arrumados e strings limpas):"
-- SELECT * FROM silver_vendas;

-- 3. "Vejam o prato feito para o Cientista de Dados (tabela analítica):"
-- SELECT * FROM gold_perfil_clientes;
