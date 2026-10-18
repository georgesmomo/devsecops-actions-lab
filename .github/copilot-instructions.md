# Instructions pour GitHub Copilot (chat, revue de code, coding agent)

- Application : API Flask dans `app/`, image Docker multi-stage, deploiement Kubernetes `k8s/`.
- Toute nouvelle action GitHub doit etre epinglee par SHA complet avec le tag en commentaire.
- `permissions:` au minimum dans chaque workflow ; jamais `write-all`.
- Ne jamais ecrire de secret en clair : utiliser `secrets.*` ou OIDC.
- Avant de proposer un commit : `ruff check app && ruff format app && pytest app`.
