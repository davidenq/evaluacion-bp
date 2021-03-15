#!/bin/bash

# delete-api-gateway:
# gcloud api-gateway gateways list
# gcloud api-gateway gateways delete GATEWAY_ID --location=CURRENT_LOCATION
# gcloud api-gateway api-configs list
# gcloud api-gateway api-configs delete CONFIG_ID --api=API_ID --project=PROJECT_ID
# gcloud api-gateway apis delete API_ID



GATEWAY_ID=$(gcloud api-gateway gateways list| tail -1 | awk '{print $1}')
PROJECT_ID=$(gcloud projects list | tail -1 | awk '{print $1}')
CONFIG_ID=$(gcloud api-gateway api-configs list | tail -1 | awk '{print $1}')
LOCATION=$(gcloud api-gateway gateways list | tail -1 | awk '{print $2}')
API_ID=$(gcloud api-gateway api-configs list | tail -1 | awk '{print $2}')


gcloud api-gateway gateways delete  $GATEWAY_ID --location=$LOCATION 
gcloud api-gateway api-configs delete $CONFIG_ID --api=$API_ID --project=$PROJECT_ID
gcloud api-gateway apis delete $API_ID