"""
=========================================================
MINI-PROJETO: Pipeline de ETL com Python Puro
=========================================================
Este é um script base para ajudar você a iniciar o projeto.
Aqui você encontrará a estrutura de como ler arquivos CSV 
nativamente e o esqueleto das funções que você precisa criar.

DICA: Se for ler do GitHub, lembre-se de clicar no botão "Raw"
do arquivo .csv para pegar o link correto (raw.githubusercontent...)
"""

import csv
import urllib.request # Módulo nativo para fazer downloads da internet
import re
from datetime import datetime

# =========================================================
# 1. ÁREA DE FUNÇÕES (Módulos de Limpeza)
# =========================================================

def tratar_categoria(nome_categoria):
    """
    Objetivo: Substituir nulos por 'Sem Categoria', passar para minúsculo,
    remover espaços extras e limpar caracteres indesejados (Regex).
    """
    # Exemplo de verificação de nulo:
    if not nome_categoria or nome_categoria.strip() == "":
        return "Sem Categoria"
    
    # SEU CÓDIGO AQUI: 
    # 1. Aplicar .lower() e .strip()
    # 2. Utilizar o módulo 're' para limpar caracteres indesejados
    
    return nome_categoria

def formatar_data(data_string):
    """
    Objetivo: Converter string de data para o formato 'DD/MM/YYYY'.
    """
    if not data_string:
        return ""
    
    # SEU CÓDIGO AQUI: 
    # Utilizar datetime.strptime() para ler e .strftime() para formatar
    
    return data_string

# =========================================================
# 2. ÁREA DE EXECUÇÃO (Leitura de Dados)
# =========================================================

print("Iniciando a leitura dos dados...\n")

# Variáveis para o seu Relatório de Status Manual
total_linhas = 0
total_cancelados = 0
total_nulos_corrigidos = 0

# ESCOLHA A OPÇÃO A OU B PARA LER SEUS DADOS:

# ---------------------------------------------------------
# OPÇÃO A: Lendo um arquivo CSV local (baixado no seu PC)
# ---------------------------------------------------------
"""
caminho_arquivo = 'INSIRA_O_NOME_DO_SEU_ARQUIVO_AQUI.csv'
with open(caminho_arquivo, mode='r', encoding='utf-8') as arquivo:
    leitor = csv.DictReader(arquivo)
    
    for linha in leitor:
        total_linhas += 1
        # Acesse as colunas usando o nome exato do cabeçalho da base de dados.
        # Exemplo: linha['nome_da_coluna_aqui']
        
        # SEU CÓDIGO AQUI: Chamar as funções de tratamento e aplicar regras if/else
"""

# ---------------------------------------------------------
# OPÇÃO B: Lendo um arquivo CSV direto da internet (GitHub Raw)
# ---------------------------------------------------------

url_csv_raw = "https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPOSITORIO/main/NOME_DO_ARQUIVO.csv"

try:
    # Fazendo a requisição na internet
    resposta = urllib.request.urlopen(url_csv_raw)
    
    # Decodificando a resposta para texto e separando por linhas
    linhas_texto = [linha.decode('utf-8') for linha in resposta.readlines()]
    
    # Passando as linhas para o leitor de CSV nativo
    leitor_online = csv.DictReader(linhas_texto)
    
    for linha in leitor_online:
        total_linhas += 1
        
        # EXEMPLO: Parando no registro 5 só para testar se leu certo e entender as colunas
        if total_linhas <= 5:
            print(f"Linha {total_linhas}: {linha}")
            
        # SEU CÓDIGO AQUI: Implementar a lógica de limpeza para todas as linhas!

except Exception as e:
    print(f"Erro ao tentar acessar a URL: {e}")
    print("Dica: Verifique se você pegou o link 'Raw' do GitHub!")


# =========================================================
# 3. ÁREA DE RELATÓRIO
# =========================================================
print("\n--- RELATÓRIO DE STATUS ---")
print(f"Total de linhas lidas: {total_linhas}")
print(f"Total de pedidos cancelados (Regra de Negócio): {total_cancelados}")
print(f"Total de nulos corrigidos: {total_nulos_corrigidos}")
