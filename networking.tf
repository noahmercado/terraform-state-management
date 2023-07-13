# Copyright 2023 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

locals {
    vpc_name = "state-mgmt-vpc"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "example_vpc" {

  name                            = local.vpc_name
  description                     = "State Management demo VPC"
  mtu                             = 1460
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = true
  auto_create_subnetworks         = false
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "example_subnet" {

  name          = "${google_compute_network.example_vpc.name}-subnet"
  description   = replace(google_compute_network.example_vpc.description, "VPC", "subnet")
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.example_vpc.id
}

