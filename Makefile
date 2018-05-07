# name of the docker hub organisation
dockerHubOrg="threethink"
# the name of the docker image
imageName="shit-city-loadbalancer"
# the current git commit hash
commitHash=$(shell git rev-parse HEAD)

all: build

build:
	docker build --pull -t $(dockerHubOrg)/$(imageName):$(commitHash) .

local-build:
	docker build -t $(dockerHubOrg)/$(imageName):test .

push:
	@docker push $(dockerHubOrg)/$(imageName):$(commitHash)

deploy:
	TAG=$(commitHash) docker-compose up -d

recall:
	docker-compose down