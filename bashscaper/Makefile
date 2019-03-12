SHELL   := bash
VERSION := $(shell cat ./version)
NAME    := navikt/bashscaper
IMAGE   := ${NAME}:${VERSION}

bump:
	/bin/bash bump.sh

build:
	docker image build -t ${NAME} -t ${IMAGE} .

push:
	docker image push ${IMAGE}
