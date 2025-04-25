# ✨ Prettier and PMD Rule Guide for Salesforce CI/CD

This document outlines the formatting and static analysis standards enforced in the CI/CD pipeline using **Prettier** and **PMD**.

---

### ⚙️ Prettier Configuration

Defined in `.prettierrc`:

```json
{
  "printWidth": 100,
  "tabWidth": 4,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "arrowParens": "always",
  "plugins": ["prettier-plugin-apex"],
  "overrides": [
    {
      "files": "*.cls",
      "options": {
        "parser": "apex"
      }
    }
  ]
}
```

### 💡 Best Practices to Avoid Prettier Errors

- Use **single quotes** instead of double quotes for strings.
- Always add **semicolons**.
- Maintain **4 spaces per indentation level**.
- Keep **line lengths under 100 characters**.
- **Avoid manually formatting code**; run `prettier --write` before committing.

---

## 🧠 PMD Static Analysis Guide

PMD helps detect code quality issues in Apex. Check out this link for the Apex best practices - [link](https://docs.pmd-code.org/latest/pmd_rules_apex.html)

### ✅ PMD Ruleset Used

- `rulesets/apex/quickstart.xml`

### 🚫 Common Rule Violations

| Rule                               | Description                                  | Example                                                          |
|------------------------------------|----------------------------------------------|------------------------------------------------------------------|
| `ApexDoc`                          | Missing or incomplete documentation comment. | Add `/** ... */` before class/method.                            |
| `ApexCRUDViolation`                | Missing CRUD checks before DML or SOQL.      | Add `Schema.sObjectType.Account.isAccessible()` before querying. |
| `ApexUnitTestClassShouldHaveRunAs` | Tests must include `System.runAs()`.         | Wrap operations in `System.runAs(u)` block.                      |

### 💡 Best Practices to Avoid PMD Errors

- Add Javadoc-style comments to **every Apex class and method**.
- Before DML/SOQL, check permissions using **CRUD and FLS**.
- In test classes, **always include** at least one `System.runAs()` block.
- **Avoid deeply nested logic** or large methods; break into smaller units.

---

## ✅ Summary: Tips for Developers

| Area       | Tip                                                                                        |
|------------|--------------------------------------------------------------------------------------------|
| Formatting | Use Prettier locally before commit: `prettier "force-app/**/*.{cls,html,js,json}" --write` |
| CRUD/FLS   | Always check for access before accessing fields or records                                 |
| ApexDocs   | Comment every public method and class                                                      |
| Tests      | Always wrap at least one operation in `System.runAs()`                                     |
| Tooling    | Set up your IDE (like VSCode) to auto-format on save using Prettier                        |

---

Following this guide ensures smooth PR merges and consistent code quality in every environment 🚀.
