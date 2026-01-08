
---

````markdown
# Project 01: Deploy Simple EC2 with Terraform

## 📌 Project Overview
This project demonstrates the core fundamentals of **Infrastructure as Code (IaC)** by deploying a secure **Amazon EC2 instance** using **Terraform** within the **AWS Default VPC**.

The primary focus is not just provisioning an EC2 instance, but doing so using **security best practices**, **dynamic resource discovery**, and **modern AWS management techniques** suitable for real-world DevOps environments.

---

## 🏗️ Architecture Overview

**Key design decisions:**

- **Networking**
  - Uses the **AWS Default VPC** and **Default Subnets** to simplify networking for a beginner-friendly setup.
  - Public subnet is selected dynamically using Terraform data sources.

- **Compute**
  - Single **Amazon EC2 instance**
  - OS: **Amazon Linux 2**
  - Instance type optimized for learning and low cost.

- **Security**
  - ❌ No inbound ports are opened (including SSH on port 22).
  - ✅ Instance access is handled exclusively through **AWS Systems Manager (SSM)**.
  - Eliminates SSH keys entirely.

- **IAM Integration**
  - An **IAM Role + Instance Profile** is attached to the EC2 instance.
  - Grants permissions required for SSM communication.

---

## 🔍 Dynamic Resource Discovery

Instead of hardcoding values, this project uses Terraform **data sources**:

- `data "aws_ami"`  
  Automatically fetches the **latest Amazon Linux 2 AMI**.

- `data "aws_vpc"`  
  Retrieves the **default VPC**.

- `data "aws_subnets"`  
  Dynamically discovers subnets inside the default VPC.

This approach ensures the infrastructure remains **portable**, **up-to-date**, and **environment-agnostic**.

---

## 📊 Outputs & Visibility

The following outputs are provided after deployment:

- **EC2 Instance ID**
  - Used to connect to the instance via AWS SSM.

- **Public IP Address**
  - Marked as **Sensitive** and hidden by default to follow security best practices.
  - Can be retrieved manually when needed:

```bash
terraform output ec2_public_ip
````

---

## 🛠️ Prerequisites

Ensure the following tools are installed and configured before deployment:

1. **AWS CLI**

   * Configured with valid IAM credentials.

2. **Terraform CLI**

   * Minimum version: `v1.5.0`
   * Tested and optimized with `v1.11.x`

3. **AWS Session Manager Plugin**

   * Required to connect to EC2 instances using SSM.

---

## 🚀 Deployment Steps

1. **Initialize Terraform**

```bash
terraform init
```

2. **Review the execution plan**

```bash
terraform plan
```

3. **Apply the configuration**

```bash
terraform apply
```

4. **Connect to EC2 using SSM**

```bash
aws ssm start-session --target <INSTANCE_ID>
```

---

## 🧪 What You Learn from This Project

* Terraform project structure and workflow
* Using **data sources** instead of hardcoded values
* Secure EC2 access using **AWS Systems Manager**
* IAM Roles and Instance Profiles
* Managing sensitive outputs
* Real-world DevOps security mindset

---

## 🎯 Why This Project Matters

This project reflects **production-oriented thinking**, not just basic Terraform usage:

* Secure by default (no SSH)
* Uses AWS-native management tools
* Clean and readable Terraform structure
* Recruiter-friendly and interview-ready

---

## 📬 Contact

If you have questions or suggestions about this project, feel free to reach out.

```

---

