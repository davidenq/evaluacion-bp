#!/bin/bash
terraform -chdir=./infra/terraform/api-gateway init
terraform -chdir=./infra/terraform/api-gateway apply -auto-approve

# habilitar el servicio creado de api-gateway para usar google credentials
MANAGED_SERVICE=$(gcloud api-gateway apis list | tail -1 | awk '{print $4}')
echo "enable $MANAGED_SERVICE"
gcloud services enable $MANAGED_SERVICE