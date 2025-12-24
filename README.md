# 🚀 AWS EC2 Infrastructure with Terraform & Ansible

Automated AWS infrastructure provisioning using Terraform and configuration management with Ansible for Docker-based web deployment.

## 🌟 Project Overview

This project demonstrates production-grade AWS infrastructure automation:

- **Infrastructure as Code (IaC):** AWS resources managed with Terraform
- **Configuration Management:** Automated server setup with Ansible
- **Containerization:** Docker-based Nginx web server deployment
- **Security Best Practices:** VPC isolation, Security Groups, encrypted volumes

## 🛠️ Technology Stack

| Component | Tool | Purpose |
|-----------|------|---------|
| **Cloud** | AWS | Cloud infrastructure provider |
| **IaC** | Terraform | Infrastructure provisioning |
| **CM** | Ansible | Server configuration & deployment |
| **Container** | Docker | Application containerization |
| **Web Server** | Nginx | Reverse proxy / web server |
| **OS** | Ubuntu 22.04 LTS | Server operating system |

## 🏗️ Infrastructure Components

### AWS Resources Created:

- **VPC** — Custom Virtual Private Cloud (10.0.0.0/16)
- **Public Subnet** — For EC2 instance with public IP
- **Internet Gateway** — Outbound internet access
- **Route Table** — Traffic routing configuration
- **Security Group** — Firewall rules (SSH, HTTP, HTTPS)
- **EC2 Instance** — Ubuntu server with Docker

## 📁 Project Structure

```
aws-ec2-terraform/
├── terraform-iac/
│   ├── main.tf              # Main infrastructure configuration
│   ├── variables.tf         # Input variables
│   └── outputs.tf           # Output values
├── ansible-cm/
│   ├── docker-deployment.yml    # Main playbook
│   ├── inventory.ini            # Host configuration
│   └── roles/
│       ├── docker/              # Docker installation role
│       │   └── tasks/main.yml
│       └── nginx_web/           # Nginx deployment role
│           ├── tasks/main.yml
│           └── templates/
├── .github/workflows/       # CI/CD pipeline
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## 🚀 Quick Start

### Prerequisites

1. **AWS CLI** configured with credentials
2. **Terraform** >= 1.0
3. **Ansible** >= 2.9
4. **SSH Key Pair** generated locally

### Step 1: Deploy Infrastructure (Terraform)

```bash
# Clone repository
git clone https://github.com/acdagunes/aws-eks-terraform.git
cd aws-eks-terraform/terraform-iac

# Set AWS credentials
export TF_VAR_aws_access_key="your_access_key"
export TF_VAR_aws_secret_key="your_secret_key"

# Initialize and apply
terraform init
terraform plan
terraform apply -auto-approve
```

### Step 2: Configure Server (Ansible)

```bash
# Update inventory with EC2 public IP
cd ../ansible-cm

# Run playbook
ansible-playbook -i inventory.ini docker-deployment.yml
```

### Step 3: Verify Deployment

```bash
# Check running containers
ssh ubuntu@<EC2_PUBLIC_IP> "docker ps"

# Test web server
curl http://<EC2_PUBLIC_IP>
```

## 🔧 Configuration

### Terraform Variables (terraform.tfvars)

```hcl
region        = "eu-central-1"
instance_type = "t3.micro"
cluster_name  = "devops-demo"
```

### Ansible Inventory (inventory.ini)

```ini
[droplet_host]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

## 🔒 Security Features

- ✅ VPC network isolation
- ✅ Security Groups with minimal open ports
- ✅ Encrypted EBS volumes (gp3)
- ✅ SSH key-based authentication
- ✅ No hardcoded credentials in code

## 🎓 Skills Demonstrated

- AWS Cloud Infrastructure (VPC, EC2, Security Groups)
- Terraform Infrastructure as Code
- Ansible Configuration Management
- Ansible Roles & Playbooks
- Docker Containerization
- CI/CD Pipeline Integration
- Linux System Administration
- Network Security Best Practices

## 📈 Deployment Flow

```
Terraform Apply → AWS Resources Created → Ansible Playbook → Docker Installed → Nginx Running
      ↓                    ↓                    ↓                  ↓               ↓
   VPC/EC2            Security Groups      Server Config      Container        Web Server
```

## 📄 License

MIT License

---

**Status:** ✅ Production Ready | 🔄 IaC Managed | 🔒 Secured
