# Datasets Públicos BioFreelancer
Datos de uso libre creados para talleres y cursos BioFreelancer.

Descripción de los datasets

### Rgym/got.csv
> Este dataset fue creado por iaguilaror@gmail.com el 21 de Abril de 2022.
> Contiene informacion sobre la calificación de la crítica del sitio IMDB (internet movie database)
> para cada uno de los episodios de Game Of Thrones de HBO
> Fuente: https://www.imdb.com/title/tt0944947/

### Rgym/senadoresmx2022.csv
> Este dataset fue creado por iaguilaror@gmail.com el 010 de Abril de 2022.
> Contiene informacion sobre la escolaridad de los senadores de la republica en Mexico
> Fuente: https://www.senado.gob.mx/64/senadores#SG
> y datos de: http://sil.gobernacion.gob.mx/portal

### Rgym/will_o_chris.csv
> Este dataset fue creado por iaguilaror@gmail.com el 04 de Abril de 2022.
> Contiene informacion de una encuesta random a un grupo pequeño de gente en facebook
> Le preguntamos a la gente a quien apoyaban en el "conflicto" chris rock vs will smith
> Fuente: Encuesta random en facebook
> Disclaimer: en biofreelancer no apoyamos ninguna forma de violencia

### Rgym/guerra.csv
> Este dataset fue creado por iaguilaror@gmail.com el 04 de Abril de 2022.
> Contiene informacion del la cantidad de muertes en conflictos armados desde 1989 hasta 2020
> Incluye las muertes civiles, militantes de algún bando, y de afilicación desconocida
> Fuente: Uppsala Conflict Data Program Department of Peace and Conflict Researc
> Fuente original de los datos: https://ucdp.uu.se/
> Descripción original de los datos: https://ucdp.uu.se/downloads/ged/ged211.pdf
> Procesamiento: Israel aguilar selecciono y renombró columnas a partir del dataset "ged211.csv", con el siguiente código:
````
select( year, dyad_name, where_description, deaths_a:deaths_unknown ) %>%
  mutate( muertes_militantes = deaths_a + deaths_b ) %>% 
  rename( anio = year,
          involucrados = dyad_name,
          lugar = where_description,
          muertes_civiles = deaths_civilians,
          muertes_desconocidas = deaths_unknown ) %>% 
  select( -deaths_a, -deaths_b )
````

### Rgym/AIFA.csv
> Este dataset fue creado por iaguilaror@gmail.com el 24 de Marzo de 2022.
> Contiene informacion del los vuelos que salen desde el Aeropuerto Internacional Felipe Ángeles hasta esta fecha
> Categorizados por tipo de vuelo (Nacional, Internacional)
> Fuente de los datos: El financiero
> URL: https://www.elfinanciero.com.mx/nacional/2022/03/21/estos-son-los-precios-de-los-vuelos-que-salen-del-aifa/

### Rgym/mascotas.csv
> Este dataset fue creado por iaguilaror@gmail.com el 22 de Marzo de 2022.
> Contiene informacion del número total de mascotas en México, además del número de gatos y perros (en calidad de mascota)
> Fuente de los datos: # Fuente de los datos: 01EST_T12-MASCOTAS.xlsx
> URL: https://www.inegi.org.mx/programas/enbiare/2021/#Tabulados  > Mascotas
> Número de mascotas por entidad federativa, según el tipo de mascota		
> INEGI - ENBIARE 2021 (Encuesta Nacional de Bienestar Autorreportado (ENBIARE) 2021)

### Rgym/exportaciones_ucrania.csv
> Este dataset fue creado por iaguilaror@gmail.com el 19 de Marzo de 2022.
> Contiene informacion de las exportaciones Ucranianas estimadas
> Fuente de los datos: https://www.fao.org/faostat/en/#data/TM
> FAO-ONU

### Rgym/sueldos.csv
> Este dataset fue creado por iaguilaror@gmail.com el 12 de Marzo de 2022.
> Contiene informacion resumida de los sueldos promedio mensuales en México, para diferentes profesiones.
> Se descargaron los datos para 2016 a 2021, para el primer trimestre de cada año. Las categorias de las profesiones son definidas por el portal www.datamexico.org.
> por ejemplo: https://datamexico.org/es/profile/occupation/investigadores-y-especialistas-en-ciencias-exactas-biologicas-ingenieria-informatica-y-en-telecomunicaciones

### Rgym/emisiones_co2.csv
TO-DO taken from https://github.com/owid/co2-data
> edited by iaguilar to calculate per capita change from 2019 to 2020, per country.

### Rgym/capacidadelectrica.csv
TO-DO taken from https://www.gob.mx/sener/articulos/programa-para-el-desarrollo-del-sistema-electrico-nacional

### Rgym/maizmexico.csv
TO-DO taken from https://www.fao.org/faostat/en/#home
merge de https://www.fao.org/faostat/en/#data/TCL
y https://www.fao.org/faostat/en/#data/QCL

### Rgym/bitcoin.csv
TO-DO taken from https://mx.investing.com/crypto/bitcoin/btc-usd-historical-data

### Rgym/anime.csv
TO-DO taken from kaggle.

### Rgym/nobels.csv
TO-DO

### Rgym/nuevos_ingresos_universidadmx.csv
TO-DO

### Rgym/nuevos_ingresos_universidadmx.csv
TO-DO

### Rgym/natam_projects.csv
TO-DO

### Rgym/lluviasmx.csv
> Este dataset fue creado por iaguilaror@gmail.com el 11 de Diciembre de 2021.
> Contiene informacion de https://smn.conagua.gob.mx/es/climatologia/temperaturas-y-lluvias/resumenes-mensuales-de-temperaturas-y-lluvias?fbclid=IwAR1RMXFu6TmpnHMlul9q82FmRgsDa99EUXwc9t9Qsz29N07XwYnRA-0H1vM
> Son las mediciones de promedio mensual de lluvias ( precipiación en mm ) de enero a noviembre 2021

### Rgym/deseos_2022.csv
> Este dataset fue creado por iaguilaror@gmail.com el 4 de Diciembre de 2021.
> Contiene informacion resultado de encuestar 87 personas en facebook.
> Se les pidio que fueran de Mexico. Las respuestas fueron anonimas.
> Cada encuestado registro su edad y la cantidad de dinero en pesos mexicanos MXN que quisieran ganar mensualmente, despues de impuestos, en el año 2022.

### Rgym/1000genomes_variants_chr21.vcf.gz
TODO

### Rgym/circoslinks/
TODO

### Rgym/finanzas2021.cvs
> Este dataset fue creado por iaguilaror@gmail.com el 13 de Noviembre de 2021.
> Contiene informacion simulada para gastos y ahorros personales a lo largo de cada dia del anio 2021.
 
### Rgym/lol.csv
> Este dataset fue creado por iaguilaror@gmail.com el 7 de Noviembre de 2021.
> Contiene informacion de los stats de los campeones de LOL registrados hasta esta fecha
> La informacion fue tomada de [la wiki de lol](https://leagueoflegends.fandom.com/wiki/List_of_champions/Base_statistics)
> iaguilar elimino las columnas de incrementos; solo mantuvo los stats base.

### Rgym/smash_data.csv
> Este dataset fue creado por iaguilaror@gmail.com el 30 de Octubre de 2021.
> Contiene informacion resumidad sobre 1.5 millones de enfrentamientos 1vs1 en Smassh Bros. Ultimate.
> La informacion fue adaptada de [el autor original](https://github.com/ben-heil/ultimate_matchups)
> iaguilar realizo el summarize para saber el numero de partidas, ganadas, perdidas, y win ratio a partir del dataset de ben-heil.

### Rgym/Padron Sistema Nacional de Investigadores 1984 a 2020/Anexo.39121_Membresía Nacional_1984-2021.xlsx
> Este dataset fue creado por iaguilaror@gmail.com el 17 de Octubre de 2021.
> Contiene informacion sobre el padrón histórico del Sistema Nacional de Investigadores de México, desde su creación en 1984 a 2020.
> La informacion fue solicitada a través del portal de transparencia del gobierno de méxico. En el directorio se incluyen los oficios de respuesta del gobierno a la solicitud de información.
> Se eliminó la columna con el nombre completo de los investigadores por respeto a su privacidad.
> Si requieres el nombre de los investigadores, puedes solicitarlo al portal de transparencia.

### Rgym/extintas1500.csv
> Este dataset fue creado por iaguilaror@gmail.com el 16 de Octubre de 2021.
> Contiene informacion sobre el numero de especies extintas desde 1500 hasta 2020, en diferentes categorias.
> La informacion fue descargada de [our world in data](https://ourworldindata.org/birds?fbclid=IwAR2clJxiM7BWo4Xwedehs586eTqt1lBYcbhbHU3St9JCPZs0lzPe1PvQwn8)
> iaguilar agrego las columnas de "categoria"	e "imagen"
> Esta data no se debe usar con fines de lucro, ni tampoco usarse sin citar la fuente Our World in Data original.


### Rgym/proteinas_romero_matriz.xlsx

> Este dataset fue creado por [Sergio Romero-Romero](https://www.researchgate.net/profile/Sergio-Romero-Romero)
> Subido por iaguilaror@gmail.com el 29 de Septiembre de 2021.
> Los datos provienen de la comparación de secuencias de aminoácidos entre proteínas diseñadas De Novo.
> El archivo es formato excel, y contiene una matriz triangular de 17 x 17 proteínas.
> En cada celda se registra el porcentaje de identidad de secuencia entre pares de proteínas.
> Para más información consultar el siguiente artículo: [Romero-Romero, Sergio, et al. "The stability landscape of de novo TIM barrels explored by a modular design approach." Journal of molecular biology 433.18 (2021): 167153.](https://www.sciencedirect.com/science/article/pii/S002228362100382X)

### Rgym/genomas_covid_mexico.csv
> Este dataset fue creado por iaguilaror@gmail.com el 08 de Octubre de 2021.
> Contiene informacion para todas las muestras SARS-CoV-2 enviadas desde Mexico al portal GISAID.
> La informacion fue descargada el 04 de Octubre de 2021 a las 10AM. Asi que este dataset no contiene muestras despues de esa fecha.
> La data base de muestras y fechas viene del portal [GISAID](https://www.gisaid.org/)
> Esta data no se debe usar con fines de lucro, ni tampoco usarse sin citar la fuente GISAID original.

### R_para_principiantes/pueblos_magicos_2021.csv

> Este dataset fue creado por iaguilaror@gmail.com el 22 de Septiembre de 2021.
> La data base de estado y pueblo se obtuvo de datos de la secretaria de turismo (sectur) 2020.
> Nos falta registrar los pueblos agregados entre 2020 y 2021.
> La informacion de latitud, longitud, altitud y cantidad de habitantes se obtuvo de wikipedia, y no se hizo verificación exhaustiva.
> La información es mejorable. Se aceptan contribuciones.
> La columna de "region" se asigno arbitrariamente a criterio de iaguilaror@gmail.com y solo con fines de simplificar un ejercicio en R.
> No tomar esta regionalización como una fuente seria.

### R_para_principiantes/pingus.csv
> Este dataset fue colectado y publicado por Dr. Kristen Gorman y la estacion Palmer, Antarctica LTER.
> Contiene informacion colectada en tres islas diferentes de 344 pinguinos, pertenecientes a tres especies diferentes.
> La data proviene del paquete de R "palmerpenguins"
> Esta data no se debe usar con fines de lucro, ni tampoco usarse sin citar la fuente: 
> > Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
> > Archipelago (Antarctica) penguin data. R package version 0.1.0.
> > https://allisonhorst.github.io/palmerpenguins/. doi:
> > 10.5281/zenodo.3960218.
