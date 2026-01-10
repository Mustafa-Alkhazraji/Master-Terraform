```md
# Terraform AWS ALB + EC2 Learning Project

This is a **learning-focused Terraform project** that demonstrates how to deploy a simple web application on AWS using:

- VPC with public subnets
- Application Load Balancer (ALB)
- EC2 instances running Nginx
- Target Groups & Listeners
- User Data for instance bootstrapping

The project is intentionally kept simple and readable, following **Terraform and AWS best practices**, and is suitable for beginners learning Infrastructure as Code (IaC).

---

## 🏗 Architecture Overview

```

Internet
|
v
Application Load Balancer (ALB)
|
v
EC2 Instances

```

- Traffic enters through the **ALB**
- ALB forwards requests to EC2 instances
- Each EC2 instance runs **Nginx**
- Instances respond with hostname & private IP (for demo purposes)

---

## 📁 Project Structure

```

.
├── alb.tf            
├── ec2.tf            
├── network.tf        
├── provider.tf       
├── variables.tf      
├── outputs.tf        
├── user_data.sh      
├── versions.tf       
└── README.md

````

---

## ⚙️ Prerequisites

Before you start, make sure you have:

- **Terraform >= 1.14**
- **AWS CLI configured**
- An AWS account with sufficient permissions

```bash
aws configure
````

---

## 🚀 How to Deploy

1. Initialize Terraform:

```bash
terraform init
```

2. Review the execution plan:

```bash
terraform plan
```

3. Apply the infrastructure:

```bash
terraform apply
```

4. After deployment, Terraform will output the **ALB DNS name**.
   Open it in your browser:

```
http://<alb_dns_name>
```

---

## 📤 Outputs

| Name           | Description                               |
| -------------- | ----------------------------------------- |
| `alb_dns_name` | DNS name of the Application Load Balancer |
| `alb_url`      | HTTP URL of the ALB                       |

---

## 🔐 Security Notes

* ALB allows inbound HTTP traffic from the internet
* EC2 instances only accept traffic from the ALB
* Security groups follow **least privilege principles**

> ⚠️ This setup is for **learning purposes only** and is not production-hardened.

---

## 🧠 Learning Goals

This project helps you practice:

* Terraform resource structure
* AWS networking basics
* Load balancing concepts
* EC2 bootstrapping using user data
* Clean repository organization for GitHub

---

## 🛠 Possible Improvements

* Convert resources into reusable Terraform modules
* Add Auto Scaling Group
* Add HTTPS with ACM
* Add private subnets & NAT Gateway
* Add CI/CD (GitHub Actions)

---

## 📚 Disclaimer

This project is created **for educational purposes** and should not be used directly in production environments without proper security hardening.

---

## 👤 Author

Created by **[Mustafa AL khazraji]**
Learning DevOps & Cloud Infrastructure 🚀

```