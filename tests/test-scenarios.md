# Test scenarios
1. Compliant: eu-west-1, t3.micro, encrypted root, IMDSv2 required, private SSH CIDR. Expect all five policies PASS.
2. Non-compliant: us-east-1, m5.24xlarge, unencrypted root, IMDSv2 optional, SSH from 0.0.0.0/0. Expect all five policies FAIL.
3. Inspect generated `tfplan` and capture actual HCP/Sentinel policy evaluations. A Terraform plan succeeding is not a Sentinel PASS.
4. Document actual commands, exit codes, screenshots and run URLs; do not fabricate outcomes.
