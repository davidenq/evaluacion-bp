#!/bin/bash

# create configmap
kubectl apply -f ./infra/deployments/app/configmap.yml

# create deployment
DEVPATH=./infra/deployments/app/deployment.yml

awk -v envhash=$SHA '{gsub(/HASH/, envhash);print}' $DEVPATH >> temp.yml
kubectl apply -f ./temp.yml
rm -rf ./temp.yml

# create service
kubectl apply -f ./infra/deployments/app/services.yml