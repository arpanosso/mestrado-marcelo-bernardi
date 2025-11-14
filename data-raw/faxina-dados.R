library(tidyverse)

dados <- readxl::read_xlsx("data-raw/Estatistica_Extratos_Alan_v1.xlsx") |>
  janitor::clean_names() |>
  mutate(
    cfc_i = ifelse(tratamento == 18,media_dia_1,NA),
    cfc_1 = mean(cfc_i,na.rm=TRUE),
    icm_1 = (cfc_1 - media_dia_1)/cfc_1*100,
    cfc_j = ifelse(tratamento == 18,media_dia_2,NA),
    cfc_2 = mean(cfc_j,na.rm=TRUE),
    icm_2 = (cfc_2 - media_dia_2)/cfc_2*100
  ) |>
  select(tratamento:repeticao,icm_1,icm_2) |>
  mutate(
    trat = case_when(
      tratamento == 1  ~ "Álcool",
      tratamento == 2  ~ "Lavanda",
      tratamento == 3  ~ "Canela",
      tratamento == 4  ~ "Pimenta",
      tratamento == 5  ~ "Alho",
      tratamento == 6  ~ "Limão",
      tratamento == 7  ~ "Açafrão",
      tratamento == 8  ~ "Ora-pro-nóbis",
      tratamento == 9  ~ "Eucalipto",
      tratamento == 10 ~ "Orégano",
      tratamento == 11 ~ "Hortelã",
      tratamento == 12 ~ "Cravo",
      tratamento == 13 ~ "Arruda",
      tratamento == 14 ~ "Boldo",
      tratamento == 15 ~ "Gengibre",
      tratamento == 16 ~ "Manjericão",
      tratamento == 17 ~ "Tomilho",
      tratamento == 18 ~ "Testemunha",
      TRUE ~ NA_character_
    )
  )
glimpse(dados)

write_rds(dados,
                    "data/data-icm.rds")
