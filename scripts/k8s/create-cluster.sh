#!/bin/bash
terraform -chdir=./infra/terraform/k8s init
terraform -chdir=./infra/terraform/k8s apply -auto-approve