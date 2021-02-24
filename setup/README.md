# Setup

## Integrantes

1. Adrian Rama
2. Ariel May
3. Frania Suarez
4. Mario Mancilla

## Pasos para ejecutar el programa

1. Clonar el repositorio
2. Instalar las gemas
``` bundle install```
3. Crear un archivo ```application.yml``` en la ruta
```reloj-checador/config/ ``` y agregar las credenciales para la conexión a la base de datos
```
host_postgres: <host>
port_postgres: <puerto>
username_postgres: <contraseña>
password_postgres: <usuario>
```
4. iniciar el servidor ingresando a la carpte ```reloj-checador```  y ``` rails s```