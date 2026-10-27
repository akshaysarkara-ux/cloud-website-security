CloudGuard — Secure Cloud Website Infrastructure

Project Overview

CloudGuard is a cloud infrastructure and security project focused on designing a secure, scalable, and cost-conscious architecture for hosting static websites.

The project explores how cloud storage, content delivery networks, HTTPS, access controls, and security testing can be combined to improve website availability and reduce common security risks.

The existing website is hosted using GitHub Pages. An AWS-based architecture is being designed and documented as a proposed deployment.

Objectives

- Design a secure static website hosting architecture.
- Understand object storage and content delivery networks.
- Apply security-by-design principles to cloud infrastructure.
- Document storage security and access-control requirements.
- Test website security configurations and record findings.
- Explore infrastructure automation and cost-conscious cloud design.

Proposed Architecture

The proposed AWS architecture consists of:

- Amazon S3: Stores static website assets privately.
- Amazon CloudFront: Distributes website content through a content delivery network.
- Origin Access Control (OAC): Allows CloudFront to access the private S3 origin without making the bucket publicly accessible.
- HTTPS: Protects data in transit between visitors and the website.
- GitHub: Hosts the project source code and documentation.

Deployment status: The current website is published using GitHub Pages. The AWS architecture is a proposed design and has not yet been deployed or verified in a live AWS environment.

Security Approach

The project focuses on the following security principles:

- Least-privilege access.
- Private object storage.
- Secure content delivery.
- HTTPS and transport security.
- Configuration review and security testing.
- Cost awareness and avoidance of unnecessary cloud resources.

Repository Contents

File| Purpose
"index.html"| Website source code
"cloudsecurityarchitecture.png"| Cloud architecture diagram
"security-checklist.txt"| Security review checklist
"security-plan.txt"| Security planning documentation
"storage-plan.txt"| Storage design documentation
"test-results.txt"| Recorded test results

Technologies and Tools

- HTML
- GitHub and GitHub Pages
- Amazon S3 — proposed
- Amazon CloudFront — proposed
- AWS Origin Access Control — proposed
- Terraform — planned infrastructure automation

Current Status

The website and initial project documentation are available in this repository. The next development phase focuses on improving the architecture documentation, validating security assumptions, and preparing reproducible infrastructure configuration.

AWS deployment will only be attempted if it can be completed within an acceptable budget and with appropriate billing safeguards.

Learning Outcomes

This project is intended to develop practical knowledge of cloud architecture, storage security, content delivery, access control, infrastructure documentation, and cloud cost management.

Disclaimer

This repository is an educational project. Features described as proposed or planned should not be interpreted as implemented or production-tested.

Author

Computer Science student interested in cloud computing, infrastructure engineering, and cloud security.
