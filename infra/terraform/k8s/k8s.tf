resource "google_container_cluster" "cluster_2" {
  name               = "cluster-2"
  location           = "us-east1"
  initial_node_count = 1
}