REGISTRY := registry.localhost
REPO     := app-docker-scratch
NAME     := whiteapp
TAG      := $$(git log -1 --format=%h --abbrev=8)
IMG      := ${REPO}.${REGISTRY}/${NAME}:${TAG}
LATEST   := ${NAME}:latest

build:
	@docker build -t ${IMG} .

login:
	@docker login https://${REPO}.${REGISTRY}

push:
	@docker push ${IMG}

apply:
	@kubectl apply -f deployments/

rm:
	@kubectl delete deploy,svc,secret --all