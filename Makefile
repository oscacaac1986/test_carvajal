DOCKER_CONFIG_FILE := ~/.docker/config.json
USERNAME = $(shell jq -r '.auths["https://index.docker.io/v2/"].username' $(DOCKER_CONFIG_FILE))
PASSWORD = $(shell jq -r '.auths["https://index.docker.io/v2/"].password' $(DOCKER_CONFIG_FILE))
IMAGEN_NAME="oscacaac1986/test_carvajal"
docker-login:
	@$(eval DOCKER_USERNAME := $(shell jq -r '.auths."https://index.docker.io/v1/".auth' $(DOCKER_CONFIG_FILE) | base64 -d | cut -d: -f1))
    @$(eval DOCKER_PASSWORD := $(shell jq -r '.auths."https://index.docker.io/v1/".auth' $(DOCKER_CONFIG_FILE) | base64 -d | cut -d: -f2-))
    @docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)

docker-build:
	@docker build -t $(IMAGEN_NAME) .

pull-docker:
	@docker pull $(IMAGEN_NAME)

push-docker:
	@docker push $(IMAGEN_NAME)


deploy-hub: docker-build docker-login push-docker
