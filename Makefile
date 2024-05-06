DOCKER_CONFIG_FILE := ~/.docker/config.json
USERNAME = $(shell jq -r '.auths["https://index.docker.io/v2/"].username' $(DOCKER_CONFIG_FILE))
PASSWORD = $(shell jq -r '.auths["https://index.docker.io/v2/"].password' $(DOCKER_CONFIG_FILE))
IMAGEN_NAME="oscacaac1986/test_carvajal"


docker-login:
	echo $(USERNAME) 
	echo $(PASSWORD)
	docker login -u $(USERNAME) -p $(PASSWORD)

