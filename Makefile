test:
	pytest ./app/test_server.py

deploy:
	sh ./scripts/k8s/deployment.sh

create-k8s-cluster:
	sh ./scripts/k8s/create-cluster.sh

create-deployments:
	sh ./scripts/k8s/namespace.sh
	sh ./scripts/k8s/deployment.sh
	sh ./scripts/k8s/ingress.sh



create-api-gateway:
		sh ./scripts/api-gateway/create.sh

delete-api-gateway:
	sh ./scripts/api-gateway/delete.sh