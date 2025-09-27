###
# Copia y pega este codigo para replicar el ejercicio de hoy

# instala pacman para trabajar mas facil
install.packages( "pacman" )

# cargar la data simulada
pacman::p_load( "vroom" )

# Leer el archivo TSV usando R base
tiktok.df <- vroom( file = "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/yt-lives/minutos_tiktok.tsv" )

# Revisar estructura del dataframe
str( tiktok.df )

#
# Paso 1 — Exploración y descriptivos -------------------------------

# Paquetes
if ( !requireNamespace( "pacman", quietly = TRUE ) ) install.packages( "pacman" )
pacman::p_load( dplyr, ggplot2 )

# 1A) Asegurar tipos y limpiar NAs esenciales
df <- tiktok.df |>
  filter( !is.na( grupo ), !is.na( minutos_tiktok ) ) |>
  mutate(
    grupo = factor( grupo ),                # convertir a factor
    minutos_tiktok = as.numeric( minutos_tiktok )
  )

# 1B) Revisión rápida
df |> count( grupo )                        # tamaño por grupo
sum( is.na( df$minutos_tiktok ) )          # NAs en la variable de interés
sum( df$minutos_tiktok < 0 )               # ¿hay valores negativos?

# 1C) Resumen descriptivo por grupo
desc <- df |>
  group_by( grupo ) |>
  summarise(
    n       = n(),
    media   = mean( minutos_tiktok ),
    sd      = sd( minutos_tiktok ),
    mediana = median( minutos_tiktok ),
    p25     = quantile( minutos_tiktok, 0.25 ),
    p75     = quantile( minutos_tiktok, 0.75 ),
    min     = min( minutos_tiktok ),
    max     = max( minutos_tiktok ),
    .groups = "drop"
  )

desc

# 1D) Vista rápida de la distribución
ggplot( df, aes( x = grupo, y = minutos_tiktok ) ) +
  geom_violin( trim = FALSE, alpha = 0.2 ) +
  geom_boxplot( width = 0.18, outlier.alpha = 0.35 ) +
  stat_summary( fun = mean, geom = "point",
                shape = 21, size = 2, fill = "white" ) +
  labs(
    x = "Grupo", y = "Minutos en TikTok",
    title = "Distribución de minutos por grupo"
  ) +
  theme_minimal( base_size = 12 )

#
df |> count( grupo )

desc

####
# Paso 2 — Supuestos y elección de prueba ---------------------------

pacman::p_load(rstatix, ggplot2, dplyr)

# 2A) Normalidad por grupo (ojo: con n grandes, Shapiro "detecta todo")
sw <- df |> group_by(grupo) |> shapiro_test( minutos_tiktok )
sw

# 2B) Homogeneidad de varianzas (Brown–Forsythe con centro en la mediana)
lev <- df |> levene_test(minutos_tiktok ~ grupo, center = "median")
lev

# 2C) Visuales diagnósticas rápidas
# Q-Q plots por grupo
ggplot(df, aes(sample = minutos_tiktok)) +
  stat_qq() + stat_qq_line() +
  facet_wrap(~ grupo, scales = "free_y") +
  labs(title = "Q-Q plots por grupo") +
  theme_minimal(base_size = 12)

install.packages("coin")

####
tt_welch <- df |> rstatix::t_test(minutos_tiktok ~ grupo, var.equal = FALSE) |> rstatix::add_significance()
wx       <- df |> rstatix::wilcox_test(minutos_tiktok ~ grupo) |> rstatix::add_significance()
d_eff    <- df |> rstatix::cohens_d(minutos_tiktok ~ grupo, hedges.correction = TRUE)
r_eff    <- df |> rstatix::wilcox_effsize(minutos_tiktok ~ grupo)

tt_welch
wx
d_eff
r_eff

####
# Instalar si no lo tienes
if ( !requireNamespace("ggpubr", quietly = TRUE) ) install.packages("ggpubr")
pacman::p_load(ggpubr, dplyr)

# Boxplot con anotación del test t de Welch
ggboxplot(
  df, x = "grupo", y = "minutos_tiktok",
  fill = "grupo", palette = "jco", alpha = 0.6,
  add = "jitter"      # puntos dispersos para ver la distribución
) +
  stat_compare_means(
    method = "t.test",       # usa t de Welch por defecto (var.equal = FALSE)
    label = "p.format",      # mostrará el p-value formateado
    comparisons = list(c("oficinista", "trabajador informal"))
  ) +
  labs(
    x = "Grupo",
    y = "Minutos en TikTok",
    title = "Comparación de uso de TikTok entre grupos",
    subtitle = "Prueba t de Welch"
  ) +
  theme_minimal(base_size = 13)
