//Specify provider

terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "~>4.37.0" //this version or greater
    }
  }
}

provider "google"{
    project = var.gcp_project_id
}

# Google Kubernetes Engine (GKE)
//Config for kubernetes cluster inside of google cloud
//first is the provider and the second arguement is the name of the cluster
resource "google_container_cluster" "primary"{
    name = "kubernetes-cluster-warmup-01"
    location = var.gcp_region
    initial_node_count = 1
    enable_autopilot = true
    ip_allocation_policy{
        
    }
}

# Cloud SQL
//Config for cloud sql resource

//DB Instance 

resource "google_sql_database_instance" "instance"{
    name = "cloudwarmupsql"
    region = var.gcp_region
    database_version = "MYSQL_8_0"
    settings{
        tier = "db-f1-micro" //how much memory/CPU - using the smallest one
    }

    deletion_protection = true
}

//DB itself

resource "google_sql_database" "database"{
    name = "my-database"
    instance = google_sql_database_instance.instance.name
}