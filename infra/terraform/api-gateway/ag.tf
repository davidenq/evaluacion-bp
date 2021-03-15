# code getting from https://medium.com/google-cloud/how-to-use-google-api-gateway-with-cloud-run-60698959b342
locals {
  api_config_id_prefix     = "api"
  api_gateway_container_id = "api-gw"
  gateway_id               = "gw"
}

resource "google_api_gateway_api" "api_gw" {
  provider     = google-beta
  api_id       = local.api_gateway_container_id
  display_name = "API Gateway"

}

resource "google_api_gateway_api_config" "api_cfg" {
  provider      = google-beta
  api           = google_api_gateway_api.api_gw.api_id
  api_config_id_prefix = local.api_config_id_prefix
  display_name  = "apigatewa-v1-config"

  openapi_documents {
    document {
      path     = "spec.yaml"
      contents = filebase64("spec.yaml")
    }
  }
}

resource "google_api_gateway_gateway" "gw" {
  provider   = google-beta
  region     = var.region

  api_config   = google_api_gateway_api_config.api_cfg.id

  gateway_id   = local.gateway_id
  display_name = "ApiGateway"

  depends_on = [google_api_gateway_api_config.api_cfg]
}
