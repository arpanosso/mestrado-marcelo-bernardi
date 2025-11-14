
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mestrado - Marcelo Bernardi

## Carregando Pacotes

``` r
library(tidyverse)
```

## Carregando Dados

``` r
data_set <- readr::read_rds("data/data-icm.rds")
data_set |>  glimpse()
#> Rows: 260
#> Columns: 6
#> $ tratamento <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,…
#> $ dose       <chr> "1", "1", "1", "1", "1", "2", "2", "2", "2", "2", "3", "3",…
#> $ repeticao  <dbl> 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5,…
#> $ icm_1      <dbl> 47.95203, 45.23648, 38.78706, 39.80539, 43.08667, 72.73139,…
#> $ icm_2      <dbl> 24.30233, 23.95349, 19.01163, 20.00000, 35.87209, 70.29070,…
#> $ trat       <chr> "Álcool", "Álcool", "Álcool", "Álcool", "Álcool", "Álcool",…
```

## Boxplot

``` r
data_set |> 
  ggplot(aes(y=as_factor(trat),x=icm_1,
             fill=as_factor(dose))) +
  geom_boxplot() +
  theme_bw() +
  theme(
    legend.position = "top"
  ) +
  labs(x = "ICM-1 (%)",
       y = "Tratamentos",
       fill="Doses")
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
data_set |> 
  ggplot(aes(y=as_factor(trat),x=icm_2,
             fill=as_factor(dose))) +
  geom_boxplot() +
  theme_bw() +
  theme(
    legend.position = "top"
  ) +
  labs(x = "ICM-2 (%)",
       y = "Tratamentos",
       fill="Doses")
```

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## Tabela de Médias
