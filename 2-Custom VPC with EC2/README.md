```markdown
# Project 02: Secure Private EC2 with Custom VPC (Terraform + AWS)

## 📌 Project Overview

This project demonstrates how to design and deploy a **secure AWS network architecture** using **Terraform** and **Infrastructure as Code (IaC)** principles.

The infrastructure includes:
- A **custom VPC**
- **Public and Private subnets**
- **Internet Gateway & NAT Gateway**
- A **private EC2 instance**
- **SSM-only access (no SSH, no public IP)**
- Proper **IAM roles and security groups**

The goal of this project is to showcase **real-world AWS networking and security best practices**, not just basic resource creation.

---

## 🏗️ High-Level Architecture

```

Custom VPC
├── Public Subnet (AZ-A)
│    ├── Internet Gateway
│    └── NAT Gateway
└── Private Subnet (AZ-A)
└── EC2 Instance (SSM access only)

```

---

## 🌐 Networking Design

### VPC
- Custom VPC with a user-defined CIDR block
- DNS hostnames enabled to support AWS services such as SSM, ALB, and RDS

### Subnets
- **Public Subnet**
  - Located in a single Availability Zone
  - Automatically assigns public IPs
  - Hosts the NAT Gateway

- **Private Subnet**
  - Located in the same Availability Zone
  - No public IPs
  - Hosts the EC2 instance

> ⚠️ This project intentionally uses a **Single-AZ design** to reduce cost and complexity.  
> Multi-AZ designs are recommended for production and are covered in later projects.

---

## 🌍 Internet Access & Routing

### Internet Gateway
- Attached to the VPC
- Provides inbound and outbound internet access for public resources

### NAT Gateway
- Deployed in the public subnet
- Allows **private subnet resources** to access the internet **without being publicly exposed**

### Route Tables
- **Public Route Table**
  - `0.0.0.0/0` → Internet Gateway

- **Private Route Table**
  - `0.0.0.0/0` → NAT Gateway

This ensures:
- Public resources are internet-facing
- Private resources remain isolated while still allowing outbound traffic

---

## 🖥️ Compute (EC2)

### EC2 Instance
- Deployed **inside the private subnet**
- No public IP address
- Uses the latest **Amazon Linux 2 AMI**
- Instance type: `t3.micro` (cost-efficient for learning)

### Access Method
❌ SSH is **not used**  
❌ No inbound ports are open  

✅ Access is handled **exclusively via AWS Systems Manager (SSM)**

This significantly reduces the attack surface and follows AWS security best practices.

---

## 🔐 Security

### Security Groups
- Dedicated security group for the EC2 instance
- **No ingress rules**
- Outbound traffic allowed (`0.0.0.0/0`)

This enforces a **deny-all inbound policy**.

---

## 🧾 IAM & SSM Integration

### IAM Role
- Created specifically for EC2
- Trusted by `ec2.amazonaws.com`

### IAM Policy
- `AmazonSSMManagedInstanceCore` attached
- Grants required permissions for:
  - SSM Session Manager
  - Command execution
  - Inventory & monitoring

### Instance Profile
- IAM role is attached to the EC2 instance via an instance profile

This setup allows secure, keyless access using AWS-native tooling.

---

## 🔍 Dynamic Resource Discovery

Terraform **data sources** are used to avoid hardcoding values:

- **AMI Discovery**
  - Automatically fetches the latest Amazon Linux 2 AMI

- **Availability Zones**
  - Dynamically selects an available AZ

This makes the configuration:
- More portable
- Easier to maintain
- Safer across regions

---

## 📁 Suggested Project Structure

```

project-02-secure-ec2/
├── main.tf
├── variables.tf
├── iam.tf
├── outputs.tf
├── provider.tf
└── README.md

````

---

## 🛠️ Prerequisites

Before deploying, ensure you have:

1. **AWS CLI**
   - Configured with valid credentials

2. **Terraform**
   - Version `v1.5.0+` recommended

3. **AWS Session Manager Plugin**
   - Required to connect to EC2 via SSM

---

## 🚀 Deployment Steps

1. Initialize Terraform:
```bash
terraform init
````

2. Review the plan:

```bash
terraform plan
```

3. Apply the infrastructure:

```bash
terraform apply
```

4. Connect to EC2 using SSM:

```bash
aws ssm start-session --target <INSTANCE_ID>
```

---

## 🧪 What This Project Demonstrates

* Real AWS VPC design (not default VPC)
* Public vs Private subnet separation
* Secure outbound-only private instances
* NAT Gateway usage
* IAM roles and instance profiles
* SSM instead of SSH
* Terraform best practices
* DevOps security mindset

---

## 🎯 Why This Project Matters

This is **not a toy Terraform project**.

It reflects:

* Production-oriented thinking
* AWS Well-Architected principles
* Security-first design
* Cost-awareness
* Clean, readable Infrastructure as Code

Perfect for:

* DevOps portfolios
* Technical interviews
* Demonstrating AWS networking knowledge

---

## 📬 Contact

If you have questions, suggestions, or want to discuss improvements, feel free to reach out.

```