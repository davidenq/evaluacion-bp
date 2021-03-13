build:
	sh ./scripts/docker/build.sh
run:
	sh ./scripts/docker/run.sh
publish:
	sh ./scripts/docker/publish.sh
deploy:
	sh ./scripts/k8s/deployment.sh
create-infra:
	sh ./scripts/k8s/namespace.sh
	sh ./scripts/k8s/deployment.sh
	sh ./scripts/k8s/ingress.sh
