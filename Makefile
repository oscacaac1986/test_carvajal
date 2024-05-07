DOCKER_CONFIG_FILE := ~/.docker/config.json
USERNAME = $(shell jq -r '.auths["https://index.docker.io/v2/"].username' $(DOCKER_CONFIG_FILE))
PASSWORD = $(shell jq -r '.auths["https://index.docker.io/v2/"].password' $(DOCKER_CONFIG_FILE))
PORT = "8000"
IMAGEN_NAME="oscacaac1986/test_carvajal"
CONTAINER_NAME = "test_carvajal"


docker-login:
	@echo $(USERNAME)
	@echo $(PASSWORD)
	docker login -u $(USERNAME) -p $(PASSWORD)

docker-build:
	docker build -t $(IMAGEN_NAME) .

docker-push:
	docker push $(IMAGEN_NAME)

docker-pull:
	docker pull $(IMAGEN_NAME)

docker-run:
	docker run -d --name $(CONTAINER_NAME) -p 8000:$(PORT) $(IMAGEN_NAME)

docker-logs:
	docker logs $(CONTAINER_NAME)


docker-deploy-hub: 
	@echo "Starting to build the image"; \
	make docker-build; \
	@echo "Starting docker Hub login"; \
	make docker-login; \
	@echo "Sending image to docker Hub" ; \
	make docker-push

docker-init-local: 
	@echo "downloading image"; \
	make docker-pull; \
	@echo "Running image"; \
	make docker-run; \
	@echo "Logs image"; \
	make docker-logs
	




