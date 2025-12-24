# 🚀 AWS EKS Kubernetes Cluster with Terraform

Production-ready Amazon EKS infrastructure using Terraform and Ansible for automated Kubernetes cluster deployment.

## 🌟 Project Overview

This project demonstrates enterprise-grade AWS infrastructure provisioning:

- **Infrastructure as Code (IaC):** Complete AWS resources managed with Terraform
- **Configuration Management:** Automated cluster configuration with Ansible
- **Container Orchestration:** Kubernetes (EKS) for scalable deployments
- **Security Best Practices:** IAM roles, Security Groups, private subnets

## 🛠️ Technology Stack

| Component | Tool | Purpose |
|-----------|------|---------|
| **Cloud** | AWS | Cloud infrastructure provider |
| **IaC** | Terraform | Infrastructure provisioning |
| **Container Orchestration** | Amazon EKS | Managed Kubernetes service |
| **Configuration Management** | Ansible | Cluster configuration |
| **Networking** | AWS VPC | Network isolation and security |

## 🏗️ Infrastructure Components

### AWS Resources Created:

- **VPC** — Custom Virtual Private Cloud with public/private subnets
- **EKS Cluster** — Managed Kubernetes control plane
- **EC2 Node Groups** — Worker nodes for running workloads
- **IAM Roles & Policies** — Secure access management
- **Security Groups** — Network-level firewall rules
- **NAT Gateway** — Outbound internet for private subnets

## 📁 Project Structure

```
aws-eks-terraform/
├── terraform-iac/
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── vpc.tf               # VPC configuration
│   ├── eks.tf               # EKS cluster configuration
│   ├── iam.tf               # IAM roles and policies
│   └── security-groups.tf   # Security group rules
├── ansible-cm/
│   ├── playbook.yml         # Ansible playbook
│   └── inventory/           # Host configuration
├── .github/workflows/       # CI/CD pipeline
└── README.md
```

## 🚀 Quick Start

### Prerequisites

1. **AWS CLI** configured with appropriate credentials
2. **Terraform** >= 1.0
3. **kubectl** for Kubernetes management
4. **Ansible** for configuration management

### Deployment Steps

```bash
# Clone repository
git clone https://github.com/acdagunes/aws-eks-terraform.git
cd aws-eks-terraform

# Set AWS credentials
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_REGION="us-east-1"

# Initialize and apply Terraform
cd terraform-iac
terraform init
terraform plan
terraform apply -auto-approve

# Configure kubectl
aws eks update-kubeconfig --name my-eks-cluster --region us-east-1

# Verify cluster
kubectl get nodes
```

## 🔧 Configuration

### Variables (terraform.tfvars)

```hcl
cluster_name    = "my-eks-cluster"
cluster_version = "1.28"
region          = "us-east-1"
vpc_cidr        = "10.0.0.0/16"
node_count      = 3
instance_type   = "t3.medium"
```

## 🔒 Security Features

- ✅ Private subnets for worker nodes
- ✅ IAM roles with least-privilege access
- ✅ Security groups with minimal open ports
- ✅ Encrypted EBS volumes
- ✅ VPC flow logs enabled

## 🎓 Skills Demonstrated

- AWS Cloud Architecture
- Terraform Infrastructure as Code
- Kubernetes (EKS) Administration
- Ansible Configuration Management
- VPC Networking & Security
- IAM Policy Management
- CI/CD Pipeline Integration

## 📄 License

MIT License

---

**Status:** ✅ Production Ready | 🔄 IaC Managed | 🔒 Secured