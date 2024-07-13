# Cloud Run Service Deployment with Terraform

This repository contains Terraform project to deploy a Cloud Run service using an NGINX container image. The service is configured to be accessible to all users and allows ingress traffic from all sources.

## Resources

- **google_cloud_run_v2_service**: Deploys a Cloud Run service with the specified configuration.
- **google_cloud_run_service_iam_member**: Grants the `roles/run.invoker` role to all users, allowing public access to the service.

## Usage

### Prerequisites

Make sure you have the following installed:

- Terraform

### Commands

1. Initialize Terraform:
   
   ```
   terraform init
   ```

2. Apply the Terraform configuration:
   
   ```
   terraform apply
   ```

3. After the apply completes, the Cloud Run service URL will be output:

   ```
   output "cloud_run_url" {
     value = google_cloud_run_v2_service.default.uri
   }
   ```



This README provides a basic overview and commands to deploy the Cloud Run service using Terraform. Adjust the variables and configurations as needed for your environment.
