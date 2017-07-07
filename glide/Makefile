
SHELL   := bash
VERSION := latest
NAME    := navikt/glide
IMAGE   := ${NAME}:${VERSION}

dockerhub-release: docker-build push-dockerhub

docker-build:
	docker image build -t ${IMAGE} -f Dockerfile .

push-dockerhub:
	docker image push ${IMAGE}
