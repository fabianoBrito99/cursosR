---
title: "apresentacao"
author: "Fabiano Brito"
date: "`r Sys.Date()`" 
output: flexdashboard::flex_dashboard # altere e deixe assim
---


## R Markdown


```{r setup, include=FALSE}
# Carregar pacotes necessários
library(ggplot2)
library(readr) # Se não estiver instalado, use install.packages("readr")
library(dplyr)
library(tidyverse)


# Carregar e tratar os dados
dataset <- read.csv("Depression Student Dataset.csv", stringsAsFactors = FALSE)

# Renomear colunas para português
colnames(dataset) <- c(
  "Genero", "Idade", "Pressao_Academica", "Satisfacao_Estudo", 
  "Duracao_Sono", "Habitos_Alimentares", "Pensamentos_Suicidas", 
  "Horas_Estudo", "Estresse_Financeiro", "Historico_Familiar", 
  "Depressao"
)

# Traduzir valores para português
dataset <- dataset %>%
  mutate(
    Genero = ifelse(Genero == "Male", "Masculino", "Feminino"),
    Duracao_Sono = case_when(
      Duracao_Sono == "7-8 hours" ~ "7-8 horas",
      Duracao_Sono == "5-6 hours" ~ "5-6 horas",
      Duracao_Sono == "More than 8 hours" ~ "Mais de 8 horas",
      Duracao_Sono == "Less than 5 hours" ~ "Menos de 5 horas"
    ),
    Habitos_Alimentares = case_when(
      Habitos_Alimentares == "Healthy" ~ "Saudável",
      Habitos_Alimentares == "Moderate" ~ "Moderado",
      Habitos_Alimentares == "Unhealthy" ~ "Não saudável"
    ),
    Pensamentos_Suicidas = ifelse(
      Pensamentos_Suicidas == "Yes", "Sim", "Não"
    ),
    Depressao = ifelse(
      Depressao == "Yes", "Sim", "Não"
    ),
    Historico_Familiar = ifelse(
      Historico_Familiar == "Yes", "Sim", "Não"
    )
  )


```

Sobre
=====================================  
    
Column {data-width=500}
-------------------------------------
    
### Sobre Mim
**Nome**: Fabiano Brito de souza

**E-mail:** fabiano99.fbs@gmail.com

**Instituição:** Instituto Federal De Rondônia - IFRO

**Curso:** ADS(Análise e Desenvolvimento de Sistemas)

**Profissão:** Programador Trainner e Analista de Dados


**GitHub:** https://github.com/fabianoBrito99?tab=repositories

<div style="display: flex; align-items: center;">
  <img src="minhaFoto.jpeg" alt="Foto Apresentação" style="width:400px; height: 400px; border-radius: 50%; margin-right: 15px;">
</div>


   
Column {data-width=500}
-------------------------------------
  
### Sobre o DataSet

**Conjunto de dados de alunos sobre depressão**

Este conjunto de dados examina a conexão entre saúde mental e vários fatores demográficos, acadêmicos e de estilo de vida. Inclui atributos como gênero, idade, pressão acadêmica, satisfação com o estudo, duração do sono, hábitos alimentares, horas de estudo, estresse financeiro, histórico familiar de doença mental, depressão e pensamentos suicidas. O conjunto de dados permite uma exploração de como fatores como qualidade do sono, dieta e carga de trabalho acadêmica impactam o bem-estar mental, oferecendo aplicações potenciais na identificação de padrões de riscos à saúde mental e promovendo estratégias preventivas para melhores resultados de saúde mental entre diferentes grupos demográficos.

**Link:** https://www.kaggle.com/datasets/ikynahidwin/depression-student-dataset?resource=download

![Aluno e Saude Mental](saudeMental.jpg)


```{r}


```   



Variáveis Qualitativas Ordinais {data-orientation=column}
========================================================


column {data-width=400}
--------------------------------------------------------



### Pressão Acadêmica (Pessoas Sem Depressão) {data-height=200}

```{r}
# Filtrar apenas pessoas com depressão
dataset_depressao <- dataset %>% filter(Depressao == "Não")

# Gráfico de barras para Pressão Acadêmica
grafico_pressao_academica <- ggplot(dataset_depressao, aes(x = Pressao_Academica)) +
  geom_bar(fill = "green", color = "black", alpha = 0.8) +
  labs(
    title = "Pressão Acadêmica (Pessoas Sem Depressão)",
    x = "Pressão Acadêmica",
    y = "Frequência"
  ) +
  theme_minimal()

# Exibir o gráfico
grafico_pressao_academica

```


### Estresse Financeiro (Pessoas Com Depressão) {data-height=200}


```{r}

# Filtrar apenas pessoas com depressão
dataset_depressao <- dataset %>%
  filter(Depressao == "Sim")

# Gráfico de barras para Estresse Financeiro
ggplot(dataset_depressao, aes(x = Estresse_Financeiro)) +
  geom_bar(fill = "lightblue", color = "darkblue") +
  labs(
    title = "Distribuição de Estresse Financeiro (Pessoas com Depressão)",
    x = "Estresse Financeiro",
    y = "Frequência"
  ) +
  theme_minimal()



```




column {data-width=400}
--------------------------------------------------------

### Pressão Acadêmica (Pessoas com Depressão) {data-height=200}




```{r}
# Filtrar apenas pessoas com depressão
dataset_depressao <- dataset %>% filter(Depressao == "Sim")

# Gráfico de barras para Pressão Acadêmica
grafico_pressao_academica <- ggplot(dataset_depressao, aes(x = Pressao_Academica)) +
  geom_bar(fill = "lightblue", color = "black", alpha = 0.8) +
  labs(
    title = "Distribuição da Pressão Acadêmica (Pessoas com Depressão)",
    x = "Pressão Acadêmica",
    y = "Frequência"
  ) +
  theme_minimal()

# Exibir o gráfico
grafico_pressao_academica

```



### Estresse Financeiro (Pessoas Sem Depressão) {data-height=200}


```{r}

# Filtrar apenas pessoas com depressão
dataset_depressao <- dataset %>%
  filter(Depressao == "Não")

# Gráfico de barras para Estresse Financeiro
ggplot(dataset_depressao, aes(x = Estresse_Financeiro)) +
  geom_bar(fill = "blue", color = "darkblue") +
  labs(
    title = "Distribuição de Estresse Financeiro (Pessoas Sem Depressão)",
    x = "Estresse Financeiro",
    y = "Frequência"
  ) +
  theme_minimal()
```


column {data-width=200}
--------------------------------------------------------

### Explicações dos gráficos {data-height=1000}

**Resumo dos Gráficos** 

**Pressão Acadêmica**

1. *Pessoas sem Depressão*

  - A maioria dos indivíduos relatou níveis de pouca e média pressão acadêmica.
  - Isso sugere que indivíduos sem depressão tendem a lidar melhor com as demandas acadêmicas.

2. *Pessoas com Depressão*

  - Os níveis de pressão predominantes foram muita e média pressão acadêmica.
  - Indica uma correlação entre altos níveis de pressão acadêmica e a presença de depressão.


**Estresse Financeiro**

1. *Pessoas sem Depressão*

  - Níveis predominantes de pouco e médio estresse financeiro.
  - Esse padrão sugere que o estresse financeiro pode não ser um fator determinante na ausência de depressão.


2. *Pessoas com Depressão*

  - Níveis predominantes de muito e médio estresse financeiro.
  - Reflete uma possível relação entre o alto estresse financeiro e o desenvolvimento de depressão.

**Conclusão Geral**

  - **Pressão Acadêmica e Estresse Financeiro** aparecem como fatores relevantes associados à presença de depressão.
  - Indivíduos com depressão relatam, em sua maioria, *maior pressão acadêmica e maior estresse financeiro*, enquanto aqueles sem depressão relatam níveis mais baixos desses fatores.
  - Esses padrões podem ser usados para identificar potenciais áreas de intervenção em saúde mental.






