variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "region" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone within the region"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Type of machine to deploy"
  type        = string
  default     = "e2-micro"
}
