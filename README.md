
# Azure Web Infrastructure with Terraform

This project provisions an Azure web infrastructure using Terraform. It includes virtual networks, security groups, virtual machines, a load balancer, an application gateway, an Azure SQL Database, and more.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure CLI installed and authenticated
- An Azure subscription

 

## Deployment Instructions

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd <repository-name>

2. Initialize Terraform:
   ```bash
   terraform init

3. Update the variables.tf file with your desired configuration.

4. Plan the infrastructure:
   
   ```bash
   terraform Plan

5. Deploy the infrastructure:
   ```bash
   terraform apply

6. Review the changes and confirm the deployment.

## Components

1. Virtual Network: Configured with subnets for web and database tiers.
2. Network Security Groups: Secures the web and database subnets.
3. Virtual Machines: Windows Server VMs for web and database tiers.
4. Load Balancer: Distributes traffic to the web VMs.
5. Application Gateway: Manages HTTP traffic with routing rules.
6. SQL Database: A managed Azure SQL Database with a firewall rule.
7. Key Vault: Stores sensitive information like passwords.
8. Backup: Configures Azure Backup for VMs and databases.
9. Security Center: Monitors and manages security posture.

##Cleanup

To remove the infrastructure, run:
 ```bash
   terraform destroy
   
This Terraform configuration provides a scalable, secure, and manageable Azure infrastructure stack. By using modules, variables, and providers, it adheres to best practices and ensures a modular and reusable setup. The README file includes clear instructions for deploying and managing the infrastructure, making it easy for other engineers to understand and maintain.
