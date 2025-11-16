# 1. Provider Configuration (ადგილობრივი ფაილური სისტემის მართვის პროვაიდერი)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1" 
    }
  }
}

# 2. Resource Definition (ახალი ფაილის შექმნა)
resource "local_file" "devops_config" {
  filename        = "${path.module}/devops.txt"
  content         = "Terraform is managing this content."
  file_permission = "0600"
}
