# pmb-eib
Archivos docker-compose y Dockerfile para inicializr contenedor de SIGB PMB


## Iniciar contenedor PMB a partir de docker compose
Ingresar a la carpeta en la que se encuentran los archivos

Archivo Dockerfile
Contiene los datos para descargar los ejecutables de la aplicación ya que no se logró encintrar una imagen limpia

Archivo docker-compose.yml
Contiene 3 secciones:
a) mariadb: Hace referencia al contenedor de la base de datos y los volumenes dónde se guarda la información
b) pmb: Referencia el contenedor de la aplicación. 
c) volumes: Conserva la info persistente

Archivo my.cnf
Contiene la configuración óptima de MariaDB

Desde la terminal ejecutar:
docker compose up -d --build
Esto hace Pull y deja en ejecución la aplicación

Abrir un navegador
http://localhost:8080/pmb
Inmediatamente lleva a : http://localhost:8080/pmb/tables/install.php

Clic en continuar
Denerían estar todos los parámetros actualizados

Utilisateur MySQL: pmbuser
Mot de passe utilisateur MySQL: pmbpassword
Serveur: mariadb

La siguiente página muestra todo bien y continuar

Parámetros del sistema
Usuario MySql : 	pmbuser
Contraseña : 	    pmbpassword
SServidor : 	    mariadb
Base de datos : 	pmb

Crear la base de datos

Rendez vous à la page d'accueil

http://localhost:8080/pmb/
Utilisateur :    admin
Mot de passe :   admin


Si aparece alg similar a:
¡Su versión de base de datos no está al día!
v6.01 <> v5.34

Ir a:
Administración > Módulos > Herramientas > Act. base 

Clica aquí para empezar la actualización.

Haz clic aquí para continuar...

Y repetir hasta Su base de datos está actualizadav6.01 !


Para salir
docker compose down
