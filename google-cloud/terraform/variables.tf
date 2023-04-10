//Provisioning resources on google cloud using terraform

//project id from google cloud
variable "gcp_project_id"{
    default = "dev-solstice-382923"
}

//region we are using
variable "gcp_region" {
  default = "us-east4"
}