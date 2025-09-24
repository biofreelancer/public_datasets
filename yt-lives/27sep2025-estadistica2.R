###
# Copia y pega este codigo para replicar el ejercicio de hoy

# instala pacman para trabajar mas facil
install.packages( "pacman" )

# cargar la data simulada
pacman::p_load( "vroom" )

# Leer el archivo TSV usando R base
tiktok.df <- vroom( file = "https://raw.githubusercontent.com/biofreelancer/public_datasets/refs/heads/main/yt-lives/minutos_tiktok.tsv" )

# Revisar estructura del dataframe
str(tiktok.df)
