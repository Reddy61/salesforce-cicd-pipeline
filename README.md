
# 🚀 Salesforce CI/CD Pipeline with GitHub Actions

Welcome! This project demonstrates a fully automated **Salesforce CI/CD pipeline** using **GitHub Actions**, **Prettier**, **PMD**, and a custom **Dockerized build environment**. It is designed to help Salesforce teams streamline deployments, enforce code quality, and manage multi-environment releases efficiently.

---

## 🔧 Key Features

- **Branch-based Deployments**: 
  - `main` → Validates against **Production** org.
  - `release/UAT` → Validates against **UAT** sandbox.
  - `release/QA` → Deploys directly to **QA** sandbox.

- **Automated Code Quality Gates**:
  - **Prettier** for consistent Apex, LWC, and JavaScript formatting.
  - **PMD** for static code analysis with enforced Apex best practices.

- **Slack Notifications**:
  - Real-time deployment success/failure alerts to a Slack channel.

- **Dynamic Environment Detection**:
  - Automatically detects which Salesforce org to deploy/validate based on the branch.

---

## 📂 Project Structure

```
.
├── .github/workflows/
│   ├── pr-checks.yml      # Pre-merge quality checks (Prettier + PMD)
│   └── deploy.yml         # Deployment pipeline for QA, UAT, and Prod
├── force-app/             # Salesforce source metadata
├── .prettierrc            # Prettier configuration for Apex & JS
├── .prettierignore        # Files/folders ignored by Prettier
├── .forceignore           # Files/folders ignored during Salesforce deployments
├── sfdx-project.json      # Salesforce DX project config
├── Dockerfile             # Custom Docker image for consistent CI builds
└── assets/server.key.enc  # Encrypted private key for Salesforce JWT auth
```

---

## 🧪 Automated Testing & Code Quality

### ✨ **Prettier Formatting**

- **Files Checked**: `.cls`, `.js`, `.html`, `.json`
- **Rules**: 
  - 4 spaces for indentation
  - Single quotes for strings
  - Max line width: 100 characters
  - Always include semicolons

**Run Locally**:
```bash
prettier "force-app/**/*.{cls,html,js,json}" --write
```

---

### 🧠 **PMD Static Analysis**

- **Ruleset**: `rulesets/apex/quickstart.xml`
- **Common Violations**:
  - Missing ApexDoc comments.
  - Missing CRUD/FLS checks.
  - Test classes without `System.runAs()`.

[📖 Full Apex Rules Documentation](https://docs.pmd-code.org/latest/pmd_rules_apex.html)

---

## 🛠 CI/CD Pipeline Overview

### 1. **Pre-Merge Checks** (`pr-checks.yml`):
- Runs on every **Pull Request**.
- Enforces Prettier and PMD checks.
- Blocks merge if violations are found.

### 2. **Deployments** (`deploy.yml`):
- Runs on pushes to `main`, `release/QA`, or `release/UAT`.
- Deploys or validates metadata based on target org.
- Sends deployment results to Slack.

---

## 🔐 Security & Authentication

- Uses **JWT-based authentication** with Salesforce.
- Private key is **AES-encrypted** and stored securely.

---

## 📦 Dockerized Build Environment

The pipeline uses a custom Docker image with:

- **Salesforce CLI**
- **Prettier + Apex Plugin**
- **PMD (v6.55.0)**
- **OpenJDK 11, Git, Curl, jq**

This ensures **consistent builds** across all environments.

---

## 👨‍💻 How to Use This Repo

1. **Fork/Clone** this repository.
2. Set up **GitHub Secrets**:
   - `SLACK_WEBHOOK_URL`
   - `AESKEY`, `IVKEY`, `DOCKER_HUB_USERNAME`, etc.
3. Configure your **Salesforce Connected Apps** for JWT.
4. Push a branch and open a PR to see automated checks in action!

---

## 🌟 Why This Repo?

This project is designed to:
- Showcase best practices in **Salesforce DevOps**.
- Provide a clean, extensible template for Salesforce CI/CD.
- Demonstrating real-world deployment automation, code quality enforcement, and multi-environment release strategies.

---

## 📬 Contact

Feel free to reach out if you have questions or want to collaborate!

---

## 📅 Last Updated: 2025-04-12
