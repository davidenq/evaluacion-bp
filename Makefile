build:
	sh ./scripts/docker/build.sh
run:
	sh ./scripts/docker/run.sh
publish:
	sh ./scripts/docker/publish.sh
deploy:
	sh ./scripts/k8s/deployment.sh
create-infra:
	# creating google api-gateway
	sh ./scripts/api-gateway/create.sh

	# sh ./scripts/k8s/namespace.sh
	# sh ./scripts/k8s/deployment.sh
	# sh ./scripts/k8s/ingress.sh

delete-api-gateway:
	sh ./scripts/api-gateway/delete.sh