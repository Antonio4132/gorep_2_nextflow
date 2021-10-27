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
Es posible eliminar la ruta del comando moviendo nextflow (el archivo de instalacion, no el archivo a ejecutar) a un directorio accesible en la variable $PATH, como se comenta en la documentación. El comando tendría entonces esta forma:
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

## Consultas al Módulo IA

### Similitud entre Textos

### Similares a un Texto

### Embedding de un Texto
