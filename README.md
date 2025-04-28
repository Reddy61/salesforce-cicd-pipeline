
# 🚀 Salesforce CI/CD Pipeline with GitHub Actions

Welcome! This repository showcases a fully automated **Salesforce CI/CD pipeline** built with **GitHub Actions**, **Prettier**, **PMD**, and a **custom Dockerized build environment**.

It demonstrates how to maintain high-quality Salesforce metadata deployments across multiple environments with streamlined automation, static code analysis, and formatting enforcement.

---

## 🔧 Key Features

- **Branch-based Deployments**:  
  - `main` → Validate only against **Production**.
  - `release/UAT` → Validate only against **UAT** sandbox.
  - `release/QA` → Direct deploy to **QA** sandbox.

- **Automated Code Quality Checks**:  
  - **Prettier** for Apex/LWC formatting.
  - **PMD** static code analysis for Apex quality rules.

- **Slack Notifications**:  
  - Real-time deployment success/failure alerts to Slack.

- **Secure Salesforce Authentication**:  
  - JWT-based OAuth 2.0 authentication using encrypted private key.

- **Custom Docker Environment**:  
  - Ensures consistent tool versions across all CI/CD runs.

---

## 📚 Why This Repository?

- Demonstrates modern Salesforce DevOps practices.
- Showcases a fully working CI/CD pipeline for real-world projects.

---

## 📄 Additional Documentation

📚 **Setup Instructions**  
→ [Follow the full Setup Guide here](./SETUP_GUIDE.md)

---

## 📅 Last Updated: 2025-04-12
