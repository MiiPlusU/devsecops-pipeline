# DevSecOps Pipeline Project

This project implements a comprehensive **DevSecOps pipeline** using several tools such as Jenkins, Terraform, Ansible, Docker, Kubernetes, Helm, and AWS. The goal is to automate the deployment, security, and management of infrastructure and applications, following best practices for Infrastructure as Code (IaC) and security compliance.

## Project Structure

```
devsecops-pipeline/
│
├── ansible/                    # Ansible playbooks for configuration management
├── helm/                       # Helm charts for Kubernetes resources
├── jenkins/                    # Jenkins pipeline and configuration files
│   └── Jenkinsfile             # Jenkins pipeline script
├── src/                        # Application source code (Python, JavaScript, etc.)
├── terraform/                  # Terraform configurations for AWS infrastructure
│   ├── backend/                # Terraform state management files (S3, DynamoDB)
│   ├── modules/                # Reusable Terraform modules for AWS resources
│   └── resources/              # Resource-specific configurations (EKS, EC2, etc.)
└── .github/                    # GitHub actions, if applicable
```

## Tools and Technologies

- **Jenkins**: Continuous integration and delivery (CI/CD) pipeline orchestration.
- **Terraform**: Infrastructure as Code (IaC) for provisioning AWS resources like EC2, VPC, EKS, S3, IAM, etc.
- **Ansible**: Configuration management and software provisioning for EC2 instances.
- **Kubernetes (EKS)**: Orchestration for containerized applications.
- **Helm**: Package manager for Kubernetes, used for deploying Jenkins and other applications.
- **Docker**: Containerization of applications, including separate Dockerfiles for Node.js and Python apps.
- **AWS (EBS, S3, IAM, etc.)**: Cloud infrastructure hosting, including AWS EKS, EC2, S3, IAM, and DynamoDB.
- **Git**: Version control for tracking changes in code and infrastructure configurations.
- **VSCode**: Integrated development environment for coding and connecting to the remote EC2 instance.

## Project Goals

1. **CI/CD Pipeline**: Automate the deployment of infrastructure and applications using Jenkins, with pipelines for Terraform, Helm, and Ansible.
2. **Infrastructure as Code (IaC)**: Manage cloud infrastructure using Terraform modules and resources.
3. **Security and Compliance**: Enforce security best practices and integrate compliance checks into the pipeline.
4. **Dynamic Provisioning**: Automatically provision persistent volumes using Kubernetes PVCs, backed by AWS EBS.
5. **Application Deployment**: Deploy Python and Node.js applications in Docker containers, tested locally before pushing to Kubernetes.
6. **Configuration Management**: Automate software provisioning and configuration using Ansible on EC2 instances.

## Pipeline Stages

1. **Terraform**:
   - Provisions AWS resources such as VPC, EC2, EKS, IAM roles, security groups, and more.
   - Backend state management using S3 (`devsecops-pipeline-state-bucket`) and DynamoDB for state locking.

2. **Helm**:
   - Deploys Jenkins to the EKS cluster using Helm charts.
   - Manages Kubernetes resources like PersistentVolumeClaims (PVCs) and StorageClasses for Jenkins.

3. **Ansible**:
   - Configures EC2 instances with necessary dependencies for Python, Node.js, and full-stack development.
   - Runs tasks like `yum update`, Git setup, Node.js installation via `nvm`, and virtual environment (venv) setup for Python.

4. **Docker**:
   - Dockerizes applications with separate Dockerfiles for Python and Node.js.
   - Images are built and pushed to Amazon Elastic Container Registry (ECR) before being deployed to Kubernetes.

## AWS Resources Managed by Terraform

- **EKS Cluster**: Deployed using Terraform with a node group, launch template, and custom configurations such as `user_data` scripts for bootstrapping.
- **EC2 Instances**: Managed via Terraform and Ansible for development and deployment environments, using a shared EC2 key pair across instances.
- **S3 Buckets**: Used for Terraform backend state management and application storage.
- **IAM Roles and Policies**: Created for EKS, EC2, and other AWS services, ensuring proper access control.
- **EBS Volumes**: Attached to EC2 instances and dynamically provisioned for Kubernetes workloads.

## Prerequisites

- AWS CLI (Version 2 installed, resolving conflicts with Version 1)
- Terraform
- Ansible
- Docker
- Kubernetes (kubectl)
- Jenkins

## Setup Instructions

1. **Terraform Setup**:
   - Initialize and apply the Terraform configurations under the `terraform/` directory to provision AWS resources.
   - Ensure that your Terraform backend is properly configured to store the state in S3 (`devsecops-pipeline-state-bucket`) and use DynamoDB for state locking.

   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

2. **Helm Deployment**:
   - Deploy Jenkins and other applications to your EKS cluster using Helm charts.

   ```bash
   helm install jenkins helm/jenkins
   ```

3. **Ansible Configuration**:
   - Use Ansible to configure your EC2 instances and install necessary dependencies.

   ```bash
   ansible-playbook ansible/playbook.yml
   ```

4. **Jenkins Pipeline**:
   - Set up the Jenkins pipeline using the `Jenkinsfile` located in the `jenkins/` directory. This pipeline automates Terraform, Helm, and Ansible tasks.

5. **Docker Application Deployment**:
   - Build and test your Docker containers locally before pushing them to ECR and deploying to Kubernetes.

   ```bash
   docker build -t your-app .
   docker tag your-app:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/your-app:latest
   docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/your-app:latest
   ```

## Known Issues

- Conflicts between AWS CLI version 1 and 2. Ensure that Version 2 is correctly installed.
- NodeGroup updates may fail if the EKS node group is not in the "Active" state.
- Increasing the size of EBS volumes may require additional steps for resizing without data loss.

## Future Improvements

- **Security Enhancements**: Further integration of security scanning tools into the pipeline.
- **Auto-scaling**: Implement auto-scaling for EC2 and Kubernetes workloads.
- **Logging and Monitoring**: Add centralized logging and monitoring for the applications and infrastructure using AWS CloudWatch or ELK stack.
- **Continuous Testing**: Re-add a testing stage to the Jenkins pipeline.

## Contributors

- **Ishmael Sesay** - DevOps Engineer

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
