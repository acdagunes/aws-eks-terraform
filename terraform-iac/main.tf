# main.tf (DigitalOcean-ის რესურსები)

# terraform-iac/main.tf (განახლებული)

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# დაამატე ცვლადი, რომელიც მიიღებს Token-ს GitHub Actions-დან
variable "do_token" {
  description = "DigitalOcean API Token from GitHub Secrets"
  type        = string
  sensitive   = true # უზრუნველყოფს, რომ არ გამოჩნდეს ლოგებში
}

# 2. DigitalOcean Provider-ის კონფიგურაცია
# ახლა Token-ს ექსპლიციტურად გადავცემთ ცვლადის მეშვეობით
provider "digitalocean" {
  token = var.do_token 
}

# 3. SSH გასაღების მონაცემების მოზიდვა (იყენებს ახალ პროვაიდერს)
data "digitalocean_ssh_key" "my_ssh_key" {
  name = "Nikoloz_Local_Machine"
}

# 4. Droplet-ის შექმნა (IaC-ის მთავარი ნაწილი!)
resource "digitalocean_droplet" "web_droplet" {
  image  = "ubuntu-22-04-x64" # Ubuntu-ს სტაბილური ვერსია
  name   = "ansible-compose-web-server"
  region = "fra1" # მაგალითად, ფრანკფურტი (შეგიძლია შეცვალო)
  size   = "s-1vcpu-1gb" # მინიმალური ზომა
  
  # SSH გასაღების მიბმა Droplet-ზე
  ssh_keys = [
    data.digitalocean_ssh_key.my_ssh_key.id
  ]
}
