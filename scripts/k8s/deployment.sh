#!/bin/bash

# create configmap
kubectl apply -f ./infra/k8s/deployments/app/configmap.yml

# create deployment
DEVPATH=./infra/k8s/deployments/app/deployment.yml

awk -v envhash=$SHA '{gsub(/HASH/, envhash);print}' $DEVPATH >> temp.yml
sleep 10
#kubectl apply -f ./temp.yml
rm -rf ./temp.yml

# create service
kubectl apply -f ./infra/k8s/deployments/app/services.yml