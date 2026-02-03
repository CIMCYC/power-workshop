# Qué es la consola R?
# La consola R es una interfaz interactiva donde los usuarios pueden escribir y ejecutar comandos 
# La consola muestra los resultados de los comandos

# Qué es el environment en R? 
# El environment en R es un espacio de trabajo donde se almacenan los objetos creados durante una sesión de R, 
# como variables, funciones y datos. Cada vez que se crea un objeto, este se guarda en el environment actual, 
# lo que permite acceder a él más tarde. 

# Lo que estás leyendo está dentro de un script de R. 
# Para ejecutar el código, selecciona la línea o líneas que quieres ejecutar
# y presiona Cmd + Enter (Mac) o Ctrl + Enter (Windows/Linux).

# Cómo creo una variable?
# Para crear una variable en R, simplemente asigna un valor a un nombre de variable utilizando el operador de asignación "<-". 


# --------------------------------------------- variables

# Esto crea una variable llamada "x" que contiene el valor 10. 
x <- 10

# mostrar el valor de la variable "x":
x

# Crear una variable llamada "nsim" y asignarle el valor 100000
nsim <- 10000
nsim <- 1000

# Qué valor contiene la variable "nsim"?
nsim

# --------------------------------------------- vectores

# Qué es un vector?
# Un vector en R es una estructura de datos que almacena una secuencia de elementos del mismo tipo, como números, caracteres o valores lógicos. 
# Para crear un vector en R, puedes utilizar la función c() (concatenate).

# Esto crea un vector llamado "mi_vector" que contiene los números 1, 2, 3, 4 y 5.
mi_vector <- c(1, 2, 3, 4, 5)
mi_vector

# Cuál es el promedio de los valores en "mi_vector"?
mean(mi_vector)

# Y su desviación típica?
sd(mi_vector)

# Cómo creo un vector que repita los valores de "mi_vector" dos veces?
mi_vector_repetido <- rep(c(1, 2, 3, 4, 5), times = 2)

mi_vector_repetido

# Otra forma de hacerlo es:
mi_vector_repetido <- rep(mi_vector, times = 2)

# crea un vector vacío de longitud nsim:
vector_vacío <- rep(NA, nsim)
head(vector_vacío)

# --------------------------------------------- data frames

# Esto crea un vector llamado "subj" que contiene los números del 1 al 20.
subj <- 1:20
subj

# Cómo creo un vector de caracteres en R?
# Esto crea un vector llamado "condición" que contiene dos elementos: "control" y "tratamiento".
condición <- c("control", "tratamiento")
condición

# Qué es lo que hace el argumento "each" en la función rep()?
(condición_repetida <- rep(condición, each = 10))

dat <- data.frame(subj = subj,
                  condición = condición_repetida)

dat

# Cómo creo una nueva variable en un data frame en R?
dat$cond.cod <- ifelse(dat$condición == "control", -0.5, 0.5)

# Con el signo de dólar ($) accedo a una columna específica de un data frame

dat

# Cómo muestro las primeras filas de un data frame en R?
head(dat)

# Cómo verifico que todo se haya creado correctamente?
xtabs( ~ condición + subj, data = dat)
xtabs( ~ condición, data = dat)
xtabs( ~ condición + cond.cod, data = dat)

# -------------------------------------------- matrices

# Qué es una matriz?
# Una matriz en R es una estructura de datos bidimensional que almacena elementos del mismo tipo en filas y columnas. 

# Cómo creo una matriz en R? utiliza la función matrix(). 
mi_matriz <- matrix(c("a", "b", "c", "d", "e", "f"), ncol = 3)
mi_matriz

# Cómo accedo a los elementos de una matriz en R? Usando corchetes [n_fila, n_columna]

# accede al elemento en la primera fila y primera columna
mi_matriz[1, 1] 

# accede al elemento en la segunda fila y tercera columna
mi_matriz[2, 3] 

# accede a toda la primera fila
mi_matriz[1, ]

# accede a toda la segunda columna
mi_matriz[, 2]

# -------------------------------------------- distribución normal y log-normal

# Genera un vector de 1,000,000 de tiempos de respuesta con distribución normal
tiempos_respuesta  <- rnorm(1000000, mean = 700, sd = 200)

# Dibuja un histograma de los tiempos de respuesta:
hist(tiempos_respuesta, breaks = 100)

# Dale un poco más de vidilla:
hist(tiempos_respuesta, breaks = 100, 
     main = "Histograma de tiempos de respuesta", 
     xlab = "Tiempo de respuesta (ms)", 
     col = "lightblue")

# Agrega una línea vertical en el valor medio (700 ms)
abline(v = 700, col = "red", lwd = 2)

# Genera un vector de 1,000,000 de tiempos de respuesta con distribución log-normal
tiempos_respuesta  <- rlnorm(1000000, mean = 6.59, sd = 0.25)

# visualizala:
hist(tiempos_respuesta, breaks = 100, 
     main = "Histograma de tiempos de respuesta", 
     xlab = "Tiempo de respuesta (ms)", 
     col = "lightblue")

# usa la función set.seed() para fijar la semilla de los números aleatorios
set.seed(42)
rnorm(5, mean = 0, sd = 1)
# verifia con tu compañanero/a de al lado que obtenéus los mismos resultados

# Usa la función help() o el símbolo ? para obtener ayuda sobre una función específica en R.
help(rnorm)
?rnorm()

# - -------------------------------------------- librerías

# instala la siguiente librería:
install.packages("ggplot")

# carga la librería ggplot2:
library(ggplot2)

# las librerías se instalan una sola vez, pero se cargan cada vez que inicias RStudio

# busca la sección "Packages" y verifica que se te haya cargado la librería ggplot2
# qué funciones contiene?

# instala las siguientes librerías que usaremos en el curso:
install.packages("tictoc")
install.packages("MASS")
install.packages("lme4")
install.packages("lmerTest")

# -------------------------------------------- útil
# muestra el directorio de trabajo actual
getwd()

# cambia el directorio de trabajo a una carpeta específica en tu computadora
setwd("/ruta/a/tu/carpeta/del/curso") # se suele usar al principio de un script

# cambia "/ruta/a/tu/carpeta/del/curso" por la ruta real en tu computadora

# verifica que se haya cambiado el directorio de trabajo correctamente:
getwd()

# muestra la versión de R y los paquetes cargados en la sesión actual
sessionInfo() # se suele usar al final de un script

# -------------------------------------------- tips
# shortcuts:
# Option/Alt + - crea: <- 
# Shift + Cmd/Ctrl + c crea: # en múltiples líneas

Comenta
estas
líneas

#  -------- WARNING -----------
# Shift + Cmd/Ctrl + 0 resetea la sesión de RStudio
# --------- WARNING -----------

# busca en tu tectlado dónde están estos símbolos:
# <- ~ | #

# para cambiar la disposición de los paneles en RStudio
# Tools > Global Options > Pane Layout 