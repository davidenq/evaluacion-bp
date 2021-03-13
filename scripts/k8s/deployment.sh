#!/bin/bash

# create configmap
kubectl apply -f ./infra/deployments/app/configmap.yml

# create deployment
kubectl apply -f ./infra/deployments/app/deployment.yml

# create service
kubectl apply -f ./infra/deployments/app/services.yml