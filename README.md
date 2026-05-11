# Código dos Alunos — Machine Learning e Visão Computacional T1

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Jupyter Notebook](https://img.shields.io/badge/Jupyter-Notebook-orange)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-Scikit--learn-green)
![Visão Computacional](https://img.shields.io/badge/Vis%C3%A3o%20Computacional-OpenCV-lightgrey)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

Repositório criado para organizar os códigos, atividades práticas e contribuições dos alunos da turma **Machine Learning e Visão Computacional T1**.

O objetivo principal é servir como ambiente de aprendizagem colaborativa, permitindo que os alunos pratiquem conceitos de **Python**, **Machine Learning**, **Visão Computacional**, **Jupyter Notebook**, **Git**, **GitHub** e fluxo de contribuição com **Pull Requests**.

---

## 📌 Objetivos do repositório

- Centralizar os códigos desenvolvidos pelos alunos.
- Praticar versionamento de código com Git e GitHub.
- Exercitar a criação de branches, commits e Pull Requests.
- Desenvolver atividades práticas de Machine Learning.
- Explorar exemplos de Visão Computacional.
- Estimular colaboração, revisão e melhoria contínua dos códigos.

---

## 🧠 Conteúdos abordados

Este repositório pode conter exemplos e atividades relacionados a:

- Fundamentos de Python
- Manipulação de dados com Pandas
- Visualização de dados com Matplotlib
- Modelos de Machine Learning com Scikit-learn
- Classificação de dados
- Métricas de avaliação de modelos
- Detecção de rosto
- Introdução à Visão Computacional
- Uso de notebooks Jupyter
- Fluxo de contribuição com GitHub

---

## 📁 Estrutura inicial do projeto

```text
CodigoDosAlunos/
├── Exemplo-ML-ParaGithub- Vinhos.ipynb
├── Exemplo_Detecção_de_Rosto.ipynb
├── main.py
├── LICENSE
├── Teste leo/
├── teste_365/
├── teste_365_1/
├── teste_novas_metricas/
└── .idea/
```

> A estrutura pode mudar conforme novas atividades e contribuições forem adicionadas pelos alunos.

---

## 📘 Exemplos disponíveis

### 🍷 Exemplo de Machine Learning com Vinhos

Notebook com um laboratório prático de Machine Learning utilizando um dataset de qualidade de vinhos tintos.

O objetivo é treinar um modelo para classificar vinhos como **bons** ou **ruins** com base em características químicas.

Principais etapas:

- Carregamento dos dados
- Preparação da variável de classificação
- Separação entre treino e teste
- Treinamento com `RandomForestClassifier`
- Avaliação com acurácia, matriz de confusão e relatório de classificação
- Desafio para os alunos alterarem parâmetros do modelo e abrirem um Pull Request

### 😀 Exemplo de Detecção de Rosto

Notebook voltado para prática de Visão Computacional, com foco em detecção de rosto.

Esse tipo de atividade ajuda a introduzir conceitos importantes como:

- Leitura e processamento de imagens
- Identificação de padrões visuais
- Uso de bibliotecas de visão computacional
- Aplicações práticas de IA em imagens

---

## 🛠️ Tecnologias utilizadas

- Python 3.x
- Jupyter Notebook
- Pandas
- Matplotlib
- Scikit-learn
- OpenCV
- Git
- GitHub

---

## 🚀 Como clonar o repositório

No terminal, execute:

```bash
git clone https://github.com/Machine-Learning-Visao-Computacional-T1/CodigoDosAlunos.git
```

Depois, entre na pasta do projeto:

```bash
cd CodigoDosAlunos
```

---

## 🧪 Como preparar o ambiente

Crie um ambiente virtual:

```bash
python -m venv .venv
```

Ative o ambiente virtual.

No Windows PowerShell:

```bash
.venv\Scripts\Activate.ps1
```

No Git Bash:

```bash
source .venv/Scripts/activate
```

Instale as bibliotecas principais:

```bash
pip install notebook pandas matplotlib scikit-learn opencv-python
```

Abra o Jupyter Notebook:

```bash
jupyter notebook
```

Ou abra o projeto no VS Code:

```bash
code .
```

---

## 🌱 Como criar uma branch para sua atividade

Antes de começar, atualize a branch principal:

```bash
git checkout main
git pull origin main
```

Crie uma nova branch com um nome descritivo:

```bash
git checkout -b atividade/seu-nome-descricao
```

Exemplo:

```bash
git checkout -b atividade/marcio-ajuste-random-forest
```

---

## 💾 Como salvar suas alterações

Veja os arquivos modificados:

```bash
git status
```

Adicione os arquivos alterados:

```bash
git add .
```

Crie um commit com uma mensagem clara:

```bash
git commit -m "feat: ajusta parametro do modelo Random Forest"
```

Envie sua branch para o GitHub:

```bash
git push -u origin atividade/seu-nome-descricao
```

---

## 🔁 Como abrir um Pull Request

Depois de enviar sua branch:

1. Acesse o repositório no GitHub.
2. Clique em **Compare & pull request**.
3. Confira se a comparação está correta:
   - Base: `main`
   - Compare: sua branch
4. Escreva um título claro para o Pull Request.
5. Explique o que foi alterado.
6. Clique em **Create pull request**.

Exemplo de descrição:

```text
## O que foi feito

- Alterei o valor de n_estimators no modelo RandomForestClassifier.
- Executei novamente o notebook.
- Comparei a nova acurácia com o resultado anterior.

## Resultado observado

A acurácia do modelo ficou em aproximadamente XX%.

## Observações

Essa alteração foi feita como parte da atividade prática de GitHub e Machine Learning.
```

---

## ✅ Boas práticas de contribuição

- Crie uma branch para cada atividade.
- Use nomes de branch claros e objetivos.
- Escreva mensagens de commit explicativas.
- Não envie arquivos desnecessários, como cache, arquivos temporários ou pastas de ambiente virtual.
- Antes de abrir o Pull Request, execute o notebook ou script para verificar se está funcionando.
- Explique no Pull Request o que você alterou e qual foi o resultado.

---

## 🚫 Arquivos que não devem ser enviados

Evite enviar arquivos como:

```text
.venv/
venv/
__pycache__/
.ipynb_checkpoints/
.env
.DS_Store
```

Caso necessário, crie ou atualize um arquivo `.gitignore` para evitar o envio desses arquivos.

---

## 📄 Licença

Este projeto está licenciado sob a licença **MIT**.

Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 👥 Sobre a turma

Este repositório faz parte das atividades da turma **Machine Learning e Visão Computacional T1**.

A proposta é aprender na prática, colaborando com códigos, testes, notebooks e melhorias ao longo das aulas.
