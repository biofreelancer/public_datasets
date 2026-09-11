# instalar pacman
install.packages( "pacman" )

# cargar packages
pacman::p_load( "dplyr", "vroom", "uwot",
                "ggplot2", "GGally", "ggrepel" )

# cargar data
pokemon.df <- vroom( file = "https://data.biofreelancer.com/starter" )

# crea tu escala de colores
miscol <- c( "Grass" = "green",
             "Water" = "blue",
             "Fire" = "red",
             "Normal" = "gray",
             "Electric" = "yellow" )

# como se diferencian los pokes de acuerdo a los pares de tipos de movimientos
ggplot( data = pokemon.df,
        mapping = aes( x = Grass,
                       y = Fire,
                       color = Type ) ) +
  geom_point( size = 3 ) +
  scale_color_manual( values = miscol ) +
  theme_classic( )

# veamos todos los pares posibles
ggpairs( data = pokemon.df, 
         columns = c("Grass", "Fire", "Water", "Normal", "Electric"),
         mapping = aes( color = Type ),
         upper = "blank",
         diag = "blank" ) +
  scale_color_manual( values = miscol ) +
  theme_linedraw( base_size = 20 )

# determinamos una semilla para lo random del umap
set.seed( 7 )

# obtenemos solo los valores numericos y calculamos umap ahi
umap_res <- pokemon.df |>
  select( where( is.numeric ) ) |>
  umap( n_neighbors = 9, min_dist = 0.1,
        metric = "euclidean" )

# Juntar las coordenadas umap con el dataframe original
pokemon_umap <- pokemon.df |>
  mutate( u1 = umap_res[ , 1],
          u2 = umap_res[ , 2] )

# Vemos la relacion entre los pokes
uplot1.p <- ggplot( data = pokemon_umap,
                    mapping = aes( x = u1,
                                   y = u2,
                                   fill = Type
                                   ) ) +
  geom_point( size = 3,
              shape = 21 ) +
  scale_fill_manual( values = miscol )

# vemos el plot
uplot1.p

# donde quedo pikachu y eeve?
uplot1.p +
  geom_label_repel( data = filter( pokemon_umap,
                                  Starter %in% c( "Pikachu", "Eevee" ) ),
                   mapping = aes( label = Starter ) ) +
  theme_classic( base_size = 20 )

# Pikachu y Eevee son tipo Grass???

