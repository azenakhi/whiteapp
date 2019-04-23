REGISTRY := registry.localhost
REPO     := app-docker-scratch
URL      := ${REPO}.${REGISTRY}
NAME     := whiteapp
TAG      := $$(git log -1 --format=%h --abbrev=8)
IMG      := ${NAME}:${TAG}
LATEST   := ${NAME}:latest
TEST     := ${URL}/${NAME}

build:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}
	@docker tag ${IMG} ${URL}/${IMG}
	@docker tag ${IMG} ${URL}/${LATEST}

login:
	@docker login https://${REPO}.${REGISTRY}

push:
	@docker push ${URL}/${IMG}
	@docker push ${URL}/${LATEST}

apply:
	@sed 's/\(image: \).*:.*$$/\1'${URL}'\/'${IMG}'/' k8s/deploy.yaml | kubectl apply -f -

rm:
	@kubectl delete deploy,svc,secret --all

clean:
	@docker rmi ${IMG}
	@docker rmi ${LATEST}
	@docker rmi ${URL}/${IMG}
	@docker rmi ${URL}/${LATEST}