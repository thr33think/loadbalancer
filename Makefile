imageName="shit-city-loadbalancer"
commitHash=$(shell git rev-parse HEAD)

all: build

build:
	@docker build -t $(imageName):$(commitHash) .

build-local:
	@docker build -t $(imageName):test .