DOCKER_CONFIG_FILE := ~/.docker/config.json
USERNAME = $(shell jq -r '.auths["https://index.docker.io/v2/"].username' $(DOCKER_CONFIG_FILE))
PASSWORD = $(shell jq -r '.auths["https://index.docker.io/v2/"].password' $(DOCKER_CONFIG_FILE))
IMAGEN_NAME="oscacaac1986/test_carvajal"


docker-login:
	docker login -u $(USERNAME) -p $(PASSWORD)

docker-build:
	docker build -t $(IMAGEN_NAME) .

docker-push:
	docker push $(IMAGEN_NAME)

docker-deploy-hub: 
	@echo "** Iniciar despliegue a Docker Hub **"
    @echo "Comenzando la construcción de la imagen..."
    docker build -t $(IMAGEN_NAME) .
    @echo "Completada la construcción de la imagen."
    @echo "Iniciando sesión en Docker Hub..."
    docker login -u $(USERNAME) -p $(PASSWORD)
    @echo "Sesión iniciada en Docker Hub."
    @echo "Subiendo la imagen a Docker Hub..."
    docker push $(IMAGEN_NAME)
    @echo "Imagen subida exitosamente a Docker Hub."
    @echo "** Despliegue a Docker Hub finalizado **"



