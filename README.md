# Azure DevSecOps Demo

## Overview
This repository demonstrates a **Security-First Infrastructure** pattern for Fintech environments. Due to strict NDAs with previous enterprise clients, I cannot share production code. This repository serves as a representative sample of my architectural standards.

## Contents
1. **Terraform (`main.tf`):** Defines a hardened AKS cluster with RBAC enabled, Public IPs disabled, and Network Policies enforced.
2. **CI/CD Pipeline (`security-scan.yaml`):** A GitHub Action workflow implementing "Shift Left" security:
   - **Checkov:** For IaC static analysis.
   - **Trivy:** For container vulnerability scanning.
   - **GitLeaks:** For secret detection.

## Architect
**Rojohn Hernia**
Senior DevSecOps Engineer
