SHELL   := bash
VERSION := $(shell cat ./version)
NAME    := ghcr.io/nais/naisible-playbook
IMAGE   := ${NAME}:${VERSION}

all: bump build push

bump:
	/bin/bash bump.sh

build:
	docker build -t ${NAME} -t ${IMAGE} .

push:
	docker push ${IMAGE}

