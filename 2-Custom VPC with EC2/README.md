````markdown
# Secure Private EC2 on AWS  
**Terraform | VPC | SSM**

A production-style AWS setup that deploys a **private EC2 instance** inside a **custom VPC**, following **security-first** and **Infrastructure as Code** best practices.

The EC2 instance:
- Has **no public IP**
- Allows **no inbound traffic**
- Is accessed **only via AWS Systems Manager (SSM)**

---

## Architecture Overview

```text
Custom VPC
├── Public Subnet
│   ├── Internet Gateway
│   └── NAT Gateway
└── Private Subnet
    └── EC2 Instance (SSM only)
````

---

## Key Features

* Custom VPC (no default resources)
* Public and private subnet separation
* NAT Gateway for secure outbound access
* Private EC2 with zero inbound exposure
* IAM role with `AmazonSSMManagedInstanceCore`
* Dynamic AMI and AZ discovery (no hardcoding)
* Clean, modular Terraform structure

---

## Security Design

* SSH completely disabled
* No inbound security group rules
* EC2 isolated in a private subnet
* Access handled via AWS-native SSM

This design significantly reduces the attack surface and aligns with AWS Well-Architected security principles.

---

## Project Structure

```text
.
├── main.tf
├── variables.tf
├── iam.tf
├── outputs.tf
├── provider.tf
└── README.md
```

---

## Requirements

* AWS CLI configured
* Terraform `v1.14+`
* AWS Session Manager Plugin

---

## Deployment

```bash
terraform init
terraform plan
terraform apply
```

Connect to the instance:

```bash
aws ssm start-session --target <INSTANCE_ID>
```

---

## Purpose

This project demonstrates **real AWS infrastructure design**, focusing on:

* Secure networking
* Private workloads
* Proper IAM usage
* Production-ready Terraform code

Ideal for **DevOps portfolios** and technical interviews.

```
