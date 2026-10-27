# CloudGuard — Security Verification Checklist

## Project Status
- [ ] AWS infrastructure deployed and verified
- [x] Terraform configuration committed to GitHub
- [x] Proposed architecture documented
- [x] Terraform configuration validated
- [ ] Security controls tested

> Note: AWS infrastructure has not been deployed. Items are marked complete only when the corresponding work has actually been performed.

## 1. Amazon S3 Storage Security
- [ ] Block all public access at the bucket level
- [ ] Confirm public ACLs are ignored
- [ ] Enable server-side encryption
- [ ] Verify that anonymous users cannot access stored objects
- [ ] Review bucket policies before deployment

## 2. CloudFront and HTTPS
- [ ] Configure CloudFront as the website delivery layer
- [ ] Use Origin Access Control (OAC) to access the private S3 bucket
- [ ] Redirect HTTP requests to HTTPS
- [ ] Allow access only through the intended distribution
- [ ] Verify HTTPS delivery after deployment

## 3. Identity and Access Management
- [ ] Apply least-privilege permissions
- [ ] Avoid hardcoding AWS credentials in source code
- [ ] Use temporary credentials where practical
- [ ] Review permissions before deployment

## 4. Logging and Monitoring
- [ ] Plan appropriate access logging
- [ ] Review available monitoring options
- [ ] Configure billing alerts before creating billable resources
- [ ] Review logs for unexpected access

## 5. Terraform Safety
- [ ] Run `terraform fmt` to format configuration
- [ ] Run `terraform validate` to check configuration
- [ ] Review `terraform plan` before any deployment
- [ ] Inspect planned changes for unexpected resources
- [ ] Never commit AWS credentials or secret keys

## 6. Cost and Deployment Safety
- [x] Keep AWS deployment on hold until costs and account eligibility are understood
- [ ] Review potential AWS charges before deployment
- [ ] Confirm a suitable budget and billing safeguards
- [ ] Obtain approval before creating any cloud resources

## Evidence and Results

Record test results here only after performing the relevant checks.

| Check | Result | Evidence |
|---|---|---|
| Terraform formatting | Not tested | Pending |
| Terraform validation | Passed | `terraform validate` returned success locally |
| S3 public access | Not tested | No AWS deployment |
| HTTPS delivery | Not tested | No AWS deployment |

## Important
This checklist describes planned security controls and verification steps. It does not claim that the AWS infrastructure has been deployed or that the security tests have passed.
