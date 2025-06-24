
# Curso: Dashboards Interativos com R e Flexdashboard


## 👨‍🏫 Sobre o Instrutor

- **Nome:** Fabiano Brito de Souza  
- **Instituição:** Instituto Federal de Rondônia - IFRO  
- **Curso:** ADS - Análise e Desenvolvimento de Sistemas  
- **Email:** fabiano99.fbs@gmail.com  
- **GitHub:** [fabianoBrito99](https://github.com/fabianoBrito99)


## 📦 Bibliotecas Utilizadas no Projeto

Durante a construção do dashboard, utilizamos bibliotecas fundamentais do ecossistema R:

| Pacote        | Finalidade Principal                                                                 |
|---------------|----------------------------------------------------------------------------------------|
| `readr`       | Leitura de arquivos como `.csv`, com alta performance.                                |
| `dplyr`       | Manipulação e transformação de dados (selecionar, filtrar, agrupar etc.).             |
| `ggplot2`     | Criação de gráficos estatísticos elegantes e customizáveis.                           |
| `tidyverse`   | Coleção de pacotes para ciência de dados. Inclui `readr`, `ggplot2`, `dplyr` etc.     |
| `flexdashboard` | Geração de dashboards HTML interativos diretamente a partir de arquivos `.Rmd`.    |

> Para instalar os pacotes:
```r
install.packages(c("ggplot2", "readr", "dplyr", "tidyverse", "flexdashboard"))
```

## 📂 Dataset Utilizado

O dataset utilizado é o **Depression Student Dataset**, disponível gratuitamente no Kaggle.

🔗 [Link para Download](https://www.kaggle.com/datasets/ikynahidwin/depression-student-dataset?resource=download)

Esse conjunto de dados traz informações sobre:
- Gênero, idade, sono, alimentação
- Depressão, pensamentos suicidas
- Pressão acadêmica, satisfação, histórico familiar

## 🧹 O que é Tratamento de Dados?

Tratamento de dados é o processo de **preparar os dados para análise**, limpando, padronizando e transformando variáveis. Envolve:

1. **Leitura** dos dados:
```r
dataset <- read.csv("DepressionStudentDataset.csv", stringsAsFactors = FALSE)
```

2. **Renomear colunas**:
```r
colnames(dataset) <- c("Genero", "Idade", ...)
```

3. **Traduzir valores categóricos**:
```r
dataset <- dataset %>%
  mutate(Genero = ifelse(Genero == "Male", "Masculino", "Feminino"))
```

## 🧠 Ciência de Dados vs Engenharia de Dados vs Análise de Dados

| Papel                  | Responsável por...                                                                 |
|------------------------|-------------------------------------------------------------------------------------|
| **Engenharia de Dados**| Coleta, armazenamento e preparação dos dados em larga escala (ETL, pipelines).     |
| **Análise de Dados**   | Geração de dashboards, relatórios e gráficos que ajudam na tomada de decisões.     |
| **Ciência de Dados**   | Modelagem estatística, aprendizado de máquina, previsões e experimentos analíticos.|

## 🌐 O Que é Flexdashboard?

O `flexdashboard` permite criar **dashboards em HTML com R** de forma simples, usando `R Markdown`.

Exemplo de cabeçalho (`YAML`):

```yaml
---
title: "Dashboard de Saúde Mental"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    vertical_layout: fill
    theme: cosmo
---
```

## 🗂️ Como Criar Abas (Seções) e Colunas no Flexdashboard

### 1. Criar uma seção (aba) com título:
```markdown
## Variáveis Qualitativas Ordinais
```

### 2. Criar colunas internas:
```markdown
Column {data-width=400}
-------------------------------------
```

### 3. Criar blocos com código R:
```{r}
ggplot(dataset, aes(x = Variavel)) + geom_bar()
```

### 4. Adicionar explicações textuais com Markdown puro:
```markdown
**Conclusão:** A maioria das pessoas com depressão relatou sono abaixo de 6h.
```

## 🎨 Estilização e Aparência Bonita

Você pode personalizar o tema no YAML:

```yaml
theme: cosmo
```

Temas alternativos: `cerulean`, `flatly`, `journal`, `readable`, `sandstone`, `spacelab`, `united`, `yeti`.

Outros recursos:
- Ícones em colunas: `{data-icon="fa-heartbeat"}`
- Altura personalizada: `{data-height=300}`
- Imagens:
```html
<img src="imagem.jpg" style="width:300px;">
```

## 📊 Exemplo Real de Gráfico com Explicação

```{r}
dataset %>%
  filter(Depressao == "Sim") %>%
  ggplot(aes(x = Duracao_Sono)) +
  geom_bar(fill = "orange") +
  labs(title = "Duração do Sono (com Depressão)")
```

**Explicação:** Pessoas com depressão tendem a dormir menos que 6h, conforme gráfico acima.

## 🧩 Conclusão

Neste curso, você aprendeu a:

✅ Preparar dados reais (limpeza e tradução)  
✅ Criar dashboards com `flexdashboard`  
✅ Construir gráficos com `ggplot2`  
✅ Interpretar relações entre variáveis  
✅ Estilizar e organizar seu projeto com HTML + Markdown  

## 💬 Dúvidas Frequentes

**1. Posso usar shiny junto com flexdashboard?**  
Sim, com `runtime: shiny` no YAML você adiciona interatividade como filtros.

**2. Posso exportar como PDF?**  
Não diretamente com `flexdashboard`, mas é possível gerar prints ou converter HTML via browser.


