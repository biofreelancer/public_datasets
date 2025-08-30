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

# contar NAs
colSums( is.na( delivery.df ) ) 

# eliminar las filas con NA
# Opción base R
delivery_noNA <- na.omit( delivery.df )

# Remplazar los NA 
pacman::p_load(dplyr, tidyr)

delivery.df <- delivery.df %>%
  replace_na( list( producto = "otros",
                    categoria = "otros" ) )

pacman::p_load(dplyr)

delivery.df <- delivery.df %>%
  mutate(costo = gsub( ",", ".", costo),   # cambiar coma por punto
         costo = as.numeric( costo ) )       # convertir a numérico

pacman::p_load(dplyr, tidyr)

delivery.df <- delivery.df %>%
  separate(fecha, into = c("dia", "mes", "anio"), sep = "/") %>%
  mutate(across(c(dia, mes, anio), as.integer))

pacman::p_load(dplyr)

total_mes <- delivery.df %>%
  group_by(anio, mes) %>%
  summarise(total_costo = sum(costo, na.rm = TRUE)) %>%
  arrange(anio, mes)

pacman::p_load(dplyr, scales)

delivery.df <- delivery.df %>%
  mutate(costo_moneda = dollar(costo, prefix = "$",
                               big.mark = ",", decimal.mark = "."))


pacman::p_load(dplyr)

promedio_propina <- delivery.df %>%
  group_by(producto) %>%
  summarise(promedio_propina = mean(propina, na.rm = TRUE)) %>%
  arrange(desc(promedio_propina))

pacman::p_load(dplyr)

delivery.df <- delivery.df %>%
  mutate( proporcion_propina = propina / costo )


pacman::p_load(dplyr)

mejores_propinas <- delivery.df %>%
  group_by(categoria) %>%
  summarise(promedio_propina = mean(propina, na.rm = TRUE)) %>%
  arrange(desc(promedio_propina))

mejores_propinas_producto <- delivery.df %>%
  group_by(producto) %>%
  summarise(promedio_propina = mean(propina, na.rm = TRUE)) %>%
  arrange(desc(promedio_propina))
