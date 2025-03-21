# 🏗️ Nginx website deployed on AWS infrastructure using Terraform

## 🧩 Problem to Be Solved

This project demonstrates usage of **Terraform** to provision cloud infrastructure on **AWS**, including compute, networking, IAM, and object storage resources. Each compute instance sends metadata to an object storage bucket on startup, simulating a real-world use case such as writing debug logs or instance identification data.

## 🛠️ Solution Overview

The infrastructure is divided into two independent Terraform configurations:

- **Base Configuration**: Sets up foundational resources such as networking (VPC, subnets), IAM, storage (S3), SSH authentication, and security groups.
- **Compute Configuration**: Provisions compute instances behind an Application Load Balancer using Auto Scaling. Each instance sends a custom message to S3 at startup and exposes it via Nginx over HTTP.

The solution is later optimized by:
- Replacing remote state access with **data-driven discovery**
- Modularizing components for better scalability and reusability

## 🖼️ Architecture Overview

The deployment consists of:

- A custom VPC with public subnets
- Security groups allowing SSH and HTTP access
- IAM roles and instance profiles with limited permissions
- An S3 bucket for receiving instance metadata
- EC2 instances launched via Auto Scaling and managed by a Load Balancer
- Startup scripts running on each instance to collect metadata and upload it to S3
- Nginx configured to serve the metadata message over HTTP


## 📁 Project Structure

- `base/`: Contains foundational infrastructure components
- `compute/`: Contains compute resources and Load Balancer setup
- `modules/`: Reusable modules for network, security, IAM, and compute

## ✅ Completed Tasks

### Infrastructure Setup

- Created VPC, subnets, routing tables, and gateways
- Configured SSH key management using environment variables
- Provisioned an S3 bucket with randomized naming for storing metadata
- Defined IAM policies, roles, and instance profiles for secure access
- Set up security groups to control traffic to instances and the Load Balancer

### Output Management

- Defined and exported outputs from base configuration for reuse
- Connected compute configuration to base using remote state and later via data sources

### Application Deployment

- Configured Launch Template and Auto Scaling Group
- Deployed Application Load Balancer and attached target instances
- Used startup scripts to push instance metadata to S3
- Installed and configured Nginx to expose metadata over HTTP

### State Management

- Moved individual resources between base and compute states
- Migrated local state to remote backend using AWS S3 and DynamoDB
- Imported manually created IAM resources into Terraform state

### Advanced Enhancements

- Replaced remote state with dynamic data source references
- Modularized configuration for reusability and maintainability
- Enabled Nginx-based dynamic instance metadata display

## 🌐 Final Result

After deployment:
- Compute instances dynamically launch behind a Load Balancer
- Each instance uploads metadata to S3 upon creation
- Nginx displays instance ID and UUID on port 80
- All infrastructure is managed through modular and validated Terraform code
