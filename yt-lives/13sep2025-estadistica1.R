####
# Copia y pega este codigo para replicar el ejercicio de hoy

# instala pacman para trabajar mas facil
install.packages( "pacman" )

# cargar la data simulada
pacman::p_load( "vroom" )

delivery.df <- read.table( file = "https://data.biofreelancer.com/delivery",
                           header = TRUE, sep = "\t" )

# ver la estructura de la tabla
str( delivery.df ) 
