build:
	sh ./scripts/build.sh
run:
	sh ./scripts/run.sh
publish:
	sh ./scripts/publish.sh
deploy:
	kubectl apply -f ./infra/deployments/server1/deployment.yml