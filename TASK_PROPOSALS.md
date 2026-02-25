# Codebase Review: Proposed Tasks

## 1) Typo Fix Task
**Title:** Fix duplicated `pmd` token in local static-analysis command in setup docs

**Issue found:** The setup guide currently shows `pmd pmd -d ...`, which appears to be a typo and can confuse users when running PMD manually.

**Proposed change:** Update the command to the correct CLI invocation format (for example, `pmd -d ...` or the project-preferred equivalent).

**Acceptance criteria:**
- The PMD command in `SETUP_GUIDE.md` no longer includes an accidental duplicated `pmd` token.
- Command is consistent with the repo's expected PMD usage.

## 2) Bug Fix Task
**Title:** Fix branch detection logic in deployment workflow for `release/QA` and `release/UAT`

**Issue found:** The workflow compares `${GITHUB_REF##*/}` against `release/QA` and `release/UAT`. `${GITHUB_REF##*/}` strips everything up to the last slash, so it evaluates to `QA`/`UAT`, causing these branch checks to fail and hit the unsupported branch path.

**Proposed change:** Compare against `${GITHUB_REF_NAME}` or compare `${GITHUB_REF}` directly to `refs/heads/release/QA` and `refs/heads/release/UAT`.

**Acceptance criteria:**
- Pushes to `release/QA` and `release/UAT` select the correct org credentials.
- The workflow no longer exits with "Unsupported branch" for valid release branches.

## 3) Documentation Discrepancy Task
**Title:** Align README deployment behavior description with actual workflow behavior

**Issue found:** README says:
- `main` validates only against Production,
- `release/QA` does direct deploy.

But in workflow:
- `main` performs a real deploy (no `-c` check-only flag),
- non-main branches run check-only (`-c`) with specified tests.

**Proposed change:** Update README branch behavior text to match real workflow, or update workflow behavior to match README (choose one source of truth).

**Acceptance criteria:**
- README branch-deployment matrix matches `.github/workflows/deploy.yml` exactly.
- No contradictory branch behavior statements remain.

## 4) Test Improvement Task
**Title:** Make `AccountHelperTest` deterministic and less org-dependent

**Issue found:** Test queries a user with `Profile.Name = 'Standard User'`, which can fail in orgs where profile naming/localization differs.

**Proposed change:**
- Avoid hard dependency on profile name string.
- Use a deterministic test user setup approach (or run as existing test context user where feasible).
- Add stronger assertions around expected behavior and failure modes.

**Acceptance criteria:**
- Test passes reliably across orgs without relying on hard-coded profile names.
- Test validates both successful update and at least one edge/error path.
