
```markdown
# Secure Private EC2 with Custom VPC (Terraform)

This project shows how to deploy a **secure AWS EC2 instance** inside a **private subnet** using **Terraform** and AWS best practices.

The EC2 instance:
- Has **no public IP**
- Does **not allow SSH**
- Is accessed **only via AWS SSM**

---

## Architecture

```

VPC
├── Public Subnet
│   ├── Internet Gateway
│   └── NAT Gateway
└── Private Subnet
└── EC2 (SSM only)

```

---

## What’s Included

- Custom VPC (not default)
- Public & Private subnets
- Internet Gateway + NAT Gateway
- Private EC2 instance
- IAM role with SSM access
- Security group with **no inbound rules**
- Dynamic AMI & AZ discovery

---

## Security Notes

- No SSH keys
- No open inbound ports
- EC2 can access the internet **outbound only**
- Access handled via **AWS Systems Manager**

---

## Project Structure

```

.
├── main.tf
├── variables.tf
├── iam.tf
├── outputs.tf
├── provider.tf
└── README.md

````

---

## Prerequisites

- AWS CLI configured
- Terraform `v1.5+`
- AWS Session Manager Plugin

---

## How to Deploy

```bash
terraform init
terraform plan
terraform apply
````

Connect to EC2:

```bash
aws ssm start-session --target <INSTANCE_ID>
```

---

## Why This Project

This is a **realistic AWS setup**, focused on:

* Secure networking
* Private infrastructure
* Proper IAM usage
* Clean Terraform code

Good fit for **DevOps portfolios** and interviews.

```