# Instructions for GitHub Copilot (chat, code review, coding agent)

- Application: Flask API in `app/`, multi-stage Docker image, Kubernetes deployment in `k8s/`.
- Every new GitHub Action must be pinned to a full commit SHA, with the tag as a comment.
- Minimal `permissions:` in every workflow; never `write-all`.
- Never write a secret in clear text: use `secrets.*` or OIDC.
- Before proposing a commit: `ruff check app && ruff format app && pytest app`.
