# CloudGuard — Terraform Testing Guide

## Purpose

This guide explains how to check the CloudGuard Terraform configuration locally before considering any AWS deployment.

**Current status:** The configuration is stored in GitHub. AWS resources have not been deployed.

## 1. Tools Required

- Terraform CLI
- A terminal such as PowerShell on Windows
- The CloudGuard GitHub repository

No AWS account or payment method is required for the local formatting and validation steps, provided the Terraform configuration and required provider are available locally.

## 2. Get the Project

Clone the repository:

```bash
git clone <YOUR-GITHUB-REPOSITORY-URL>
cd cloud-website-security/terraform
```

Replace `<YOUR-GITHUB-REPOSITORY-URL>` with the repository's actual URL.

Alternatively, download the repository as a ZIP file and open its `terraform` folder in your terminal.

## 3. Format the Configuration

Run:

```bash
terraform fmt -check
```

This checks whether the Terraform files are formatted consistently.

If formatting changes are needed, run:

```bash
terraform fmt
```

## 4. Initialize Terraform

Run:

```bash
terraform init
```

This downloads the required provider and prepares the working directory. It does not create AWS infrastructure, but it requires an internet connection to download provider packages.

## 5. Validate the Configuration

Run:

```bash
terraform validate
```

This checks Terraform configuration syntax and internal consistency.

A successful validation does not prove that a deployment will succeed or that the architecture is secure.

## 6. Deployment Safety

Do not run `terraform apply` for this learning project.

Before any future deployment, review:
- The proposed resources and their costs
- The S3 bucket name and regional availability
- Access permissions and bucket policies
- CloudFront and Origin Access Control configuration
- Logging, monitoring, and billing safeguards

## 7. Record Actual Results

Only record results after running the relevant commands.

| Test | Result | Notes |
|---|---|---|
| Terraform formatting | Not tested | Pending |
| Terraform initialization | Not tested | Pending |
| Terraform validation | Not tested | Pending |
| AWS deployment | Not performed | Intentionally on hold |

## Important Notes

- Never store AWS access keys, passwords, or other secrets in GitHub.
- Local validation is not the same as deploying or testing live cloud resources.
- Keep AWS deployment on hold until costs and account requirements are understood.
-
