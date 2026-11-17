# Technical report — L00205535

This prototype applies policy-as-code controls to Terraform plans for an Irish/EU digital-sovereignty scenario. It proposes approved EU regions, encrypted EC2 root storage, IMDSv2, limited EC2 types, and restricted SSH ingress. Sentinel policy enforcement should stop a non-compliant plan before apply when the policy set is attached and mandatory.

**Effectiveness:** centrally managed policies make infrastructure controls repeatable and auditable, reducing reliance on manual reviews. A successful compliant run and a rejected non-compliant run must be evidenced with actual evaluation screenshots; the repository alone is not evidence of enforcement.

**Limitations:** selecting an EU region does not ensure every backup, replica, log or administrative access remains in the EU. Jurisdiction and data residency require legal, contractual and technical analysis. Sentinel evaluates information exposed in plans, not every runtime behavior, downloaded dependency or drift. Unknown values, unsupported resources and provider schema changes require tests and policy maintenance.

**Recommendations:** use CI validation and pinned provider hashes, approved module sources and immutable revisions, dependency/security scanning, least-privilege IAM, service-specific replication checks, monitoring and regular policy regression tests. Keep mandatory rules narrow, test failures and exceptions, and review policy versions when providers change.

**Evidence status:** Pending student execution; insert actual run identifiers and screenshots before submission.

**AI declaration:** OpenAI ChatGPT GPT-6 (16 Nov 2026) assisted with initial scaffolding, sample policy logic, and writing. Prompt: “Prepare the initial Terraform Sentinel assignment project for Windows PowerShell and guide step by step, prioritizing real execution evidence and submission within three hours.” All outputs require independent student validation.
