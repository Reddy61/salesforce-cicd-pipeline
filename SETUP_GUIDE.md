
# 🛠 Salesforce CI/CD Pipeline - Full Setup Guide

This guide explains how to set up, configure, and run this Salesforce CI/CD pipeline locally or in your own GitHub repository.

---

## 📥 1. Clone or Fork the Repository

```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
```

---

## 🐳 2. Pull and Test the Custom Docker Image

This project uses a custom Docker image preconfigured with:

- Salesforce CLI
- Prettier + Apex Plugin
- PMD (v6.55.0)
- OpenJDK 11, Git, Curl, jq

**Docker Image Link**:  
👉 [jayadeepkumar61/sfdx-cicd-latest on Docker Hub](https://hub.docker.com/repository/docker/jayadeepkumar61/sfdx-cicd-latest/general)

### Pull the Docker Image
```bash
docker pull jayadeepkumar61/sfdx-cicd-latest:latest
```

### Test the Docker Image
```bash
docker run -it jayadeepkumar61/sfdx-cicd-latest bash
```

---

## 🖌 3. Format Code with Prettier Locally

Format Apex, LWC, JS, and JSON files before committing:

```bash
prettier "force-app/**/*.{cls,html,js,json}" --write
```

> Recommended: Set your editor (e.g., VSCode) to auto-format on save.

---

## 🧠 4. Run PMD Static Analysis Locally (Optional)

Analyze Apex code manually:

```bash
pmd pmd -d force-app/main/default/classes -R rulesets/apex/quickstart.xml -f text
```

Checks include:
- ApexDoc completeness
- CRUD/FLS enforcement
- Proper usage of System.runAs in tests

---

## 🔐 5. Configure GitHub Secrets

Add these to GitHub → Settings → Secrets → Actions:

| Secret Name            | Purpose                                   |
|------------------------|-------------------------------------------|
| `AESKEY`               | AES encryption key for server.key         |
| `IVKEY`                | AES initialization vector                 |
| `SLACK_WEBHOOK_URL`    | Slack incoming webhook URL                |
| `DOCKER_HUB_USERNAME`  | Docker Hub username (for pulling image)   |
| `DOCKER_HUB_PASSWORD`  | Docker Hub password/token                 |
| `PROD_CONSUMER_KEY`    | Consumer Key for Production Connected App |
| `QA_CONSUMER_KEY`      | Consumer Key for QA Connected App         |
| `UAT_CONSUMER_KEY`     | Consumer Key for UAT Connected App        |

And GitHub Variables:

| Variable Name          | Purpose                          |
|------------------------|----------------------------------|
| `SFDC_PROD_USER`       | Username for Production org      |
| `SFDC_PROD_URL`        | Login URL for Production org     |
| `SFDC_QA_USER`         | Username for QA sandbox          |
| `SFDC_QA_URL`          | Login URL for QA sandbox         |
| `SFDC_UAT_USER`        | Username for UAT sandbox         |
| `SFDC_UAT_URL`         | Login URL for UAT sandbox        |
| `SFDC_TEST_CLASSES`    | Comma-separated test class names |

---

## 🔐 6. Salesforce Connected App Setup (JWT Authentication)

1. Create a Connected App in Salesforce Setup → App Manager.
2. Enable **JWT OAuth**.
3. Set **Permitted Users** to "Admin approved users are pre-authorized".
4. Upload your public key if required.
5. Save and capture the **Consumer Key**.

---

## 📣 7. Set Up Slack Notifications

1. Create a Slack Incoming Webhook: [Slack Webhooks Setup](https://api.slack.com/messaging/webhooks).
2. Select a channel to receive notifications.
3. Copy your Webhook URL.
4. Add it to GitHub Secrets as `SLACK_WEBHOOK_URL`.

The pipeline will send deployment status alerts automatically.

---

## 🚀 8. Running the Pipeline

- **Pull Requests** trigger `pr-checks.yml` for Prettier and PMD checks.
- **Pushes** to `release/QA`, `release/UAT`, or `main` trigger deployments or validations via `deploy.yml`.
- You can also manually trigger workflows using `workflow_dispatch`.

---

## ⚙️ 9. Best Practices

- Format code locally before committing.
- Protect main, UAT, and QA branches.
- Rotate your Salesforce JWT keys periodically.
- Keep Docker image versions controlled.

---

## 📬 Need Help?

Feel free to open an issue or reach out via LinkedIn!
