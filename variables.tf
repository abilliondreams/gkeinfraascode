/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  default = "gke-project-id"
  description = "The project ID to host the cluster in"
}

variable "cluster_name_suffix" {
  description = "A suffix to append to the default cluster name"
  default     = ""
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "zones" {
  description = "The region to host the cluster in"
  default     = ["us-central1-a", "us-central1-b", "us-central1-f"]
}  

variable "network" {
  description = "The VPC network to host the cluster in"
  default     = "vpc01"
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  default     = "subnet01"
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default     = "us-central1-01-gke-01-pods"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for services"
  default     = "us-central1-01-gke-01-services"
}

variable "compute_engine_service_account" {
  description = "Service account to associate to the nodes in the cluster"
  default     = "vsts-build"
}
