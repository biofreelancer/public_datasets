# 1) Cargar (o instalar si falta) los paquetes necesarios
if ( !requireNamespace( "pacman", quietly = TRUE ) ) install.packages( "pacman" )

pacman::p_load( "vroom", "dplyr", "ggplot2" )

# leer data ----
insulina.df <- vroom( file = "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/yt-lives/insulina_glucosa.csv" )

# Aqui empieza el ejercicio ----
