imageName="shit-city-loadbalancer"

all: build

build-local:
	docker build -t $(imageName):test .