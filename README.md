# Terraform Digital Sovereignty and Sentinel — L00205535

## Purpose

Policy-as-Code prototype for Ireland/EU digital sovereignty and Terraform IaC security. **Planning only; never run `terraform apply`**. The sample AMI is intentionally fictitious.

## Architecture and decisions

* AWS region: allow `eu-west-1` (Ireland) and `eu-central-1` (Germany) as illustrative EU regions. Actual legal residency obligations depend on contracts, data flows and services.
* EC2: only `t3.micro` or `t3.small` for this exercise.
* EBS root storage must be encrypted; EC2 metadata must require IMDSv2.
* Security groups may not expose inbound TCP/22 to `0.0.0.0/0`.
* Provider: only `registry.terraform.io/hashicorp/aws`, constrained to major v5. Run `terraform init` to generate and **commit `.terraform.lock.hcl`**. Verify lock hashes, review releases, and scan dependencies in CI.
* Modules: none are used; if introduced, require approved registry/Git source and exact immutable version or commit SHA. Sentinel plan policies alone cannot reliably attest downloaded module provenance or provider binaries.

## Local steps (PowerShell)

```powershell
cd terraform
terraform init -backend=false
terraform fmt -check
terraform validate
terraform plan -refresh=false -var-file=compliant.tfvars -out=tfplan
terraform show -no-color tfplan | Out-File -Encoding utf8 ../documentation/evidence/tfplan-compliant.txt
terraform show -json tfplan | Out-File -Encoding utf8 ../documentation/evidence/tfplan-compliant.json
terraform plan -refresh=false -var-file=noncompliant.tfvars -out=tfplan-noncompliant
terraform show -no-color tfplan-noncompliant | Out-File -Encoding utf8 ../documentation/evidence/tfplan-noncompliant.txt
```

Do not claim Sentinel evaluated these plans unless HCP Terraform or Sentinel CLI actually did so. Capture screenshots of policy PASS/FAIL. Do not commit credentials or state. `.tfplan` binary is environment-specific; the requested `tfplan` is produced by the first plan command.

## HCP Terraform integration

Create an HCP Terraform workspace connected to this public repository, working directory `terraform`. Configure AWS authentication securely for real remote plans (do **not** reuse the placeholder credentials from providers.tf). Create a policy set connected to this repo, Sentinel directory `sentinel`, attach to workspace, and trigger two plan runs with appropriate variables. HCP Sentinel availability depends on account entitlements; verify policy set support before relying on it. Alternatively use Sentinel CLI with mocks for policy tests.

## Sovereignty, jurisdiction and limitations

Region controls reduce accidental placement outside the approved EU scope but do not prove end-to-end residency: logs, backups, replicas, DNS, support access, subprocessors, and cross-border administration must be evaluated separately. EU-region selection does not automatically establish GDPR compliance or Irish exclusive jurisdiction. AWS service behavior and contractual safeguards must be assessed.

## Supply-chain integrity

Version constraints and the dependency lockfile reduce drift but do not guarantee integrity against compromised publishers or malicious upstream modules. CI should verify checksums, pin actions, scan HCL, require code review, and inspect provenance/attestations. Sentinel plan-time checks cannot validate all download artifacts or post-deployment drift.

## Evidence checklist

* \[ ] `terraform init`, `validate`, compliant and noncompliant plan output saved
* \[ ] Sentinel PASS screenshot with run identifier
* \[ ] Sentinel FAIL screenshot with blocked run identifier
* \[ ] Policy set association screenshot
* \[ ] Technical report and AI disclosure completed

## AI disclosure

AI assistance: OpenAI ChatGPT, GPT-6, 16 November 2026. Prompt: “Prepare the initial Terraform Sentinel assignment project for Windows PowerShell and guide step by step, prioritizing real execution evidence and submission within three hours.” AI helped draft starter Terraform/Sentinel policies, documentation and testing commands. Student must personally execute, inspect, correct and explain all results. Add further prompts used and changes made.

