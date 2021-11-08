# GOREP2 Nextflow
Este repositorio contiene el archivo nextflow que gestiona la instalación e uso de gorep2, disponible [aquí](https://github.com/Antonio4132/gorep_2).

**NOTA:** Para el correcto funcionamiento del programa, es necesario tener instalado Docker, ver [aquí](https://docs.docker.com/engine/install/).

## Instalación y Ejecución Nextflow
Para instalar la herramienta nexflow, es suficiente con seguir los pasos descritos en la [página oficial](https://www.nextflow.io/docs/latest/getstarted.html#installation). Una vez instalado, el modo de ejecución convencional es:

```
"Directorio_ubicación_nexflow"/nexflow run "nexflow_file.nf"
```
Donde el directorio es la ubicación de la instalación de nexflow, por ejemplo:
```
/Users/Antonio/Desktop/nexflow run gorep.nf
```
Es posible eliminar la ruta del comando moviendo nextflow (el archivo de instalación, no el archivo a ejecutar) a un directorio accesible en la variable $PATH, como se comenta en la documentación. El comando tendría entonces esta forma:
```
nexflow run "nexflow_file.nf"
```

## Comandos de Instalación

Una vez descargada la herramienta, se puede poner en marcha el sistema GOREP2 con el siguiente comando:
```
nexflow run gorep.nf
```
Si es la primera vez que se lanza, el programa se dercargará el proyecto desde github y lo guardará en una carpeta llamada "GOREP". Una vez instalado lo pondrá en marcha y dejará funcionando. Si el proyecto ya está instalado, no se instalará de nuevo y se lanzará directamente.

### Parar la Ejecución
Para parar la ejecución de GOREP2, basta con utilizar el siguiente comando:
```
nexflow run gorep.nf --exit=y
```

### Actualizar el Repositorio GOREP
Si fuese necesario actualizar el repositorio GOREP2,  se puede reinstalar con este comando:
```
nextflow run gorep.nf --update=y
```

## Consultas al Módulo IA

El modulo IA contiene un skipgrama entrenado sobre una ontología, sobre el que se pueden realizar distintas consultas. 

### Similitud entre Textos

En esta consulta, se puede comprobar como de similares son dos textos utilizando la distancia del coseno. Para su ejecución, nextflow usa dos parámetros:

1. Cos1: La primera cadena de texto a comparar.
2. Cos2: La primera cadena de texto a comparar.

El resultado de la ejecución será un valor numérico, que indica como de similares son los textos, siendo cero iguales, y cuanto mayor sea el valor mas distintos serán los textos. Como ejemplo de ejecución:

```
nextflow run gorep.nf --cos1="Heart Brain" --cos2="Lung Liver Pancreas"
```

Dando como resultado:


```
N E X T F L O W  ~  version 21.04.3
Launching `gorep.nf` [stoic_coulomb] - revision: 4a35c60bdd
GOREP - N F  ~  version 1.0
=================================
Install Directory    : /Users/Antonio/Desktop/BigData/Beca/Nextflow_GOREP/gorep_2_nextflow/GOREP


Intalling GOREP...
executor >  local (3)
[d7/b6d75d] process > install_gorep [100%] 1 of 1 ✔
[9f/3b589a] process > start_gorep   [100%] 1 of 1 ✔
[fc/4570af] process > cosine_query  [100%] 1 of 1 ✔
0.616208295374933
```

### Similares a un Texto

En esta consulta, se puede comprobar que claves del modelos son mas similares al texto suministrado. Para su ejecución, nextflow usa un parámetro:

1. Sim: Texto del que buscar claves similares.

El resultado de la ejecución será una lista de tuplas clave/valor, donde la clave inidica que elemento del modelo es similar, y el valor la similitud, siendo 1 igual, y cuanto más cerca de 1 más similar. Como ejemplo de ejecución:

```
nextflow run gorep.nf --sim="Heart Brain"

```
Dando como resultado:

```
N E X T F L O W  ~  version 21.04.3
Launching `gorep.nf` [distraught_ekeblad] - revision: a0d245fe4e
GOREP - N F  ~  version 1.0
=================================
Install Directory    : /Users/Antonio/Desktop/Test_NF/GOREP


Starting GOREP...
executor >  local (2)
[e1/60bf14] process > start_gorep      [100%] 1 of 1 ✔
[ee/e14d16] process > similarity_query [100%] 1 of 1 ✔
Doing Similarity Query...
text: Heart Brain
[
  [
    "(MRI;", 
    0.9813061356544495
  ], 
  [
    "(GDS)", 
    0.9755714535713196
  ], 
  [
    "NlmCategory=\\\"METHODS\\\":Pallidal", 
    0.9750590324401855
  ], 
  [
    "thickness),", 
    0.9737231135368347
  ], 
  [
    "jerk-locked", 
    0.9734430909156799
  ], 
  [
    "wakeful,", 
    0.9730979800224304
  ], 
  [
    "Subject4_DENV", 
    0.972767174243927
  ], 
  [
    "evaluations,", 
    0.9725733995437622
  ], 
  [
    "electroencephalography,", 
    0.9724870324134827
  ], 
  [
    "Instrumental", 
    0.971684455871582
  ]
]
```

### Embedding de un Texto

En esta consulta, se obtiene el vector numérico asociado a un texto. Para su ejecución, nextflow usa un parámetro:

1. Vect: Texto del que obtener el embedding.

El resultado de la ejecución será una lista de valores numéricos, que se corresponden con el embedding. Como ejemplo de ejecución:

```
nextflow run gorep.nf --vect="Heart Brain"

```
Dando como resultado:

```
N E X T F L O W  ~  version 21.04.3
Launching `gorep.nf` [infallible_almeida] - revision: a0d245fe4e
GOREP - N F  ~  version 1.0
=================================
Install Directory    : /Users/Antonio/Desktop/Test_NF/GOREP


Starting GOREP...
executor >  local (2)
[1f/19d25d] process > start_gorep     [100%] 1 of 1 ✔
[32/7829da] process > vectorize_query [100%] 1 of 1 ✔
Doing Vecotrize Query...
text: Heart Brain
[
  -0.5900202989578247, 
  -0.4312886595726013, 
  -2.752434730529785, 
  0.5321708917617798, 
  1.9965240955352783, 
  -0.9600090384483337, 
  -0.7417000532150269, 
  0.23237694799900055, 
  0.8707584142684937, 
  0.3656192421913147
]
```
