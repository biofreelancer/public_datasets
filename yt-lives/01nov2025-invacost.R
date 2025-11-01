install.packages( "pacman" )

pacman::p_load( "invacost" )

data( invacost )

str( invacost )

######
# 1) Cargar (o instalar si falta) los paquetes necesarios
if ( !requireNamespace( "pacman", quietly = TRUE ) ) install.packages( "pacman" )

pacman::p_load( dplyr )

# 2) Contar el numero de filas por nombre común
common_name_counts <- invacost %>%
  count( Common_name, sort = TRUE )

######
# =========================================================
# Gráfico: Costos anuales (USD 2017) por especie común en México
# =========================================================

# 1) Cargar (o instalar si falta) los paquetes necesarios
if ( !requireNamespace( "pacman", quietly = TRUE ) ) install.packages( "pacman" )
pacman::p_load( dplyr, ggplot2, stringr, scales )

# 2) Filtrar registros correspondientes a México
mexico_data <- invacost %>%
  filter( str_detect( Official_country, regex( "mexico", ignore_case = TRUE ) ),
          !is.na( Common_name ),
          !is.na( Cost_estimate_per_year_2017_USD_exchange_rate ) )

# 3) Calcular el costo total por nombre común
cost_by_common <- mexico_data %>%
  group_by( Common_name ) %>%
  summarise( total_cost = sum( Cost_estimate_per_year_2017_USD_exchange_rate, na.rm = TRUE ) ) %>%
  arrange( desc( total_cost ) )

# 4) Seleccionar las 10 especies más costosas (puedes cambiar n = 10)
top10_common <- cost_by_common %>%
  slice_head( n = 10 )

# 5) Graficar en barras horizontales
ggplot( top10_common, aes( x = reorder( Common_name, total_cost ), y = total_cost ) ) +
  geom_col( fill = "steelblue" ) +
  coord_flip() +
  scale_y_continuous( labels = label_dollar( prefix = "$", scale = 1e-6, suffix = "M" ) ) +
  labs(
    title = "Costos anuales estimados (USD 2017) por especie invasora en México",
    subtitle = "Fuente: Base de datos InvaCost",
    x = NULL,
    y = "Costo total (millones USD 2017)"
  ) +
  theme_minimal( base_size = 12 )

