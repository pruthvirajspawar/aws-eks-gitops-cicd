# AWS EKS GitOps CI/CD Pipeline

An end-to-end DevOps project demonstrating automated infrastructure provisioning, container image building, and Kubernetes application deployment on Amazon EKS using Infrastructure as Code (IaC), CI/CD, and GitOps principles.

## Overview

This project demonstrates how to automate application delivery using AWS, Terraform, Docker, GitHub Actions, Kubernetes, and Argo CD.

The goal is to reduce manual deployment steps, improve deployment consistency, and manage application deployments through a Git-based workflow.

## Architecture

```text
                 Developer
                     |
                     v
                GitHub Repo
                     |
                     v
              GitHub Actions
                     |
          +----------+----------+
          |                     |
          v                     v
    Build Docker Image    Terraform Workflow
          |                     |
          v                     v
     Docker Hub             AWS Resources
          |                     |
          |                 Amazon EKS
          |                     |
          +----------+----------+
                     |
                     v
                Argo CD
                     |
                     v
             Kubernetes Cluster
                     |
                     v
              Application Pods
```

*Note: This is a conceptual architecture. Update it to match your actual workflow configuration.*

## Technologies Used

| Technology     | Purpose                          |
| -------------- | -------------------------------- |
| AWS            | Cloud infrastructure             |
| Amazon EKS     | Managed Kubernetes service       |
| Terraform      | Infrastructure provisioning      |
| Docker         | Application containerization     |
| Docker Hub     | Container image registry         |
| GitHub Actions | CI/CD automation                 |
| Kubernetes     | Container orchestration          |
| Argo CD        | GitOps-based continuous delivery |
| Git            | Version control                  |
| Linux          | Command-line environment         |

## Project Workflow

### 1. Source Code Management

* Maintain project files in GitHub.
* Track changes using Git.
* Trigger automated workflows when configured repository events occur.

### 2. Continuous Integration with GitHub Actions

* Automate the application build process.
* Build a Docker image using the project Dockerfile.
* Authenticate with Docker Hub using GitHub Actions secrets.
* Push the image to the configured container registry.

### 3. Infrastructure Provisioning with Terraform

* Define cloud infrastructure using Terraform configuration files.
* Provision the AWS resources required by the project.
* Manage infrastructure changes through Terraform workflows.

### 4. Kubernetes Deployment

* Use Kubernetes manifests to define application deployments and services.
* Run containerized workloads on Amazon EKS.
* Manage application availability and desired state through Kubernetes resources.

### 5. GitOps with Argo CD

* Connect Argo CD to the configured Git repository.
* Monitor the Kubernetes manifests stored in Git.
* Synchronize the cluster with the desired application configuration.
* Track deployment synchronization and health status through Argo CD.

*The exact sequence depends on how the repository's GitHub Actions workflows and Argo CD application are configured.*

## Repository Structure

The repository may contain files and directories similar to the following. Update this section to reflect your actual repository structure.

```text
aws-eks-gitops-cicd/
├── .github/
│   └── workflows/
│       ├── docker-ci-cd.yml
│       └── terraform-ci-cd.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
├── kubernetes/
│   ├── deployment.yaml
│   └── service.yaml
├── argocd/
│   └── application.yaml
├── Dockerfile
└── README.md
```

## Prerequisites

Install and configure the tools required for the components implemented in your project:

* Git
* Docker
* AWS CLI
* Terraform
* kubectl
* An AWS account with appropriate IAM permissions
* A Docker Hub account
* A GitHub repository
* An Amazon EKS cluster
* Argo CD, if GitOps deployment is enabled

## Configuration

### AWS Credentials

Configure AWS authentication securely for your GitHub Actions workflows.

Prefer GitHub Actions OIDC with an appropriately scoped AWS IAM role instead of long-lived AWS access keys.

### GitHub Secrets and Variables

Configure only the secrets and variables required by your actual workflows.

Examples may include:

* Docker Hub username
* Docker Hub access token
* AWS region
* AWS IAM role ARN for OIDC authentication

Never commit passwords, access tokens, private keys, or AWS credentials to GitHub.

## Running the Project

The exact commands depend on your Terraform directory, workflow configuration, and cluster setup.

### 1. Clone the repository

```bash
git clone https://github.com/pruthvirajspawar/aws-eks-gitops-cicd.git

cd aws-eks-gitops-cicd
```

### 2. Build the Docker image

From the directory containing your Dockerfile:

```bash
docker build -t <image-name>:<tag> .
```

### 3. Initialize Terraform

Navigate to the directory containing your Terraform configuration:

```bash
terraform init
terraform validate
terraform plan
```

Review the plan before applying infrastructure changes.

### 4. Configure kubectl

After your EKS cluster is available, configure access using the appropriate AWS region and cluster name:

```bash
aws eks update-kubeconfig \
  --region <aws-region> \
  --name <cluster-name>
```

Verify connectivity:

```bash
kubectl get nodes
kubectl get pods --all-namespaces
```

### 5. Verify GitOps Deployment

If Argo CD is configured, check the status of its application and verify that the desired workloads are running in Kubernetes.

```bash
kubectl get applications -A
kubectl get deployments -A
kubectl get services -A
```

The Argo CD `Application` resource must be installed for the first command to return application resources.

## Key Learning Outcomes

* Understanding AWS cloud infrastructure and Amazon EKS.
* Automating infrastructure provisioning using Terraform.
* Building and publishing container images using Docker.
* Creating CI/CD workflows with GitHub Actions.
* Deploying and managing containerized applications with Kubernetes.
* Understanding GitOps principles and Argo CD synchronization.
* Managing cloud credentials and deployment configuration securely.
* Troubleshooting infrastructure, pipeline, and Kubernetes deployment issues.

## Future Improvements

* Implement automated testing and image vulnerability scanning.
* Use AWS IAM OIDC federation for secure CI/CD authentication.
* Add Helm charts for application packaging.
* Integrate Prometheus and Grafana for monitoring.
* Add deployment notifications and pipeline status reporting.
* Implement automated cleanup and cost-control procedures.

## Author

**Pruthviraj Pawar**

GitHub: [@pruthvirajspawar](https://github.com/pruthvirajspawar)

---

If you find this project useful, consider starring the repository.
