DOCKER_CONTAINER_NAME=docker-python-flask
DOCKER_CONTAINER_VERSION=1.0.0
DOCKER_CONTAINER_VOLUME_PATH=/c/docker/volume-persistent/docker-python-flask
HTTP_PORT=5000

buildArgs=--build-arg http_port=$(HTTP_PORT)
containerName=$(DOCKER_CONTAINER_NAME)
containerPublish=--publish $(HTTP_PORT):$(HTTP_PORT)
containerVolumes=--volume $(DOCKER_CONTAINER_VOLUME_PATH):/app
containerImage=$(DOCKER_CONTAINER_NAME):$(DOCKER_CONTAINER_VERSION)

$(info ############################################### )
$(info # )
$(info # Environment variables )
$(info # )
$(info ############################################### )
$(info DOCKER_CONTAINER_NAME: $(DOCKER_CONTAINER_NAME))
$(info DOCKER_CONTAINER_VERSION: $(DOCKER_CONTAINER_VERSION))
$(info DOCKER_CONTAINER_VOLUME_PATH: $(DOCKER_CONTAINER_VOLUME_PATH))
$(info HTTP_PORT: $(HTTP_PORT))
$(info )

include ./make-commons-docker.mk