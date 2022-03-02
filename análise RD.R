rm(list = ls())
library(lubridate)
library(tidyverse)
#Rolf Regehr
#02/03/2022
# Objetivo: analisar informações de atendimentos hospitalares do SUS
# foco: Cid I21 - Infarto agudo do miocárdio

# Carrega os RDAs
load("e:/rda/dados_i21.rda")

# Fatorizando/renomeando as informações

dados_i21$SEXO <- case_when(dados_i21$SEXO == 1 ~ "H",
                            dados_i21$SEXO == 3 ~ "M")
dados_i21$DT_INTER <- ymd(dados_i21$DT_INTER)

dados_i21$COD_IDADE <- as.numeric(dados_i21$COD_IDADE)
dados_i21$idade <- if_else(as.integer(dados_i21$COD_IDADE) == 4 , dados_i21$IDADE, 0)
                           if_else(as.integer(dados_i21$COD_IDADE) == 5, 100*dados_i21$IDADE, 0)))
