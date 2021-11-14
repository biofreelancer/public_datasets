# Datasets Públicos BioFreelancer
Datos de uso libre creados para talleres y cursos BioFreelancer.

Descripción de los datasets

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
