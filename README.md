# test_carvajal

Aplicacion del clima Interfas de Usuario

## Clonar Proyecto

https://github.com/oscacaac1986/test_carvajal.git


## primeros pasos

-En la carpeta .docker de su maquina configurar config.json con la siguiente estructura de auths
    {
    "auths": {
        "https://index.docker.io/v2/": {
        "username": "<SU_NOMBRE_DE_USUARIO>",
        "password": "<SU_CONTRASEÑA>"
        }
    }
    }

## Creacion de imagen y subida a docker hub
    -defina el nombre de su imagen de docker recuerde inicializar con su id de usuario docker hub
    -ejecute comando
         make docker-deploy-hub:
    Esto creara una imagen y la enviara a docker hub de forma automatica

## contruccion de proyecto de forma local
    -comando
        docker-init-local
    Este comando se encargara de descargas la imagen nombrada en IMAGE_NAME del Makefile y contruira su proyecto luego de la descarga

    