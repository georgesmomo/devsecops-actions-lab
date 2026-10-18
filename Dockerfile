# syntax=docker/dockerfile:1
# ---------- Etape 1 : build des dependances ----------
FROM python:3.13-slim AS build
WORKDIR /src
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Etape 2 : image finale minimale ----------
FROM python:3.13-slim
LABEL org.opencontainers.image.source="https://github.com/georgesmomo/devsecops-actions-lab" \
      org.opencontainers.image.description="Labo GitHub Actions DevSecOps" \
      org.opencontainers.image.licenses="MIT"

# Utilisateur non-root (bonne pratique securite, verifiee par les scanners)
RUN useradd --create-home --uid 10001 appuser
WORKDIR /app
COPY --from=build /install /usr/local
COPY app/app.py .

ARG APP_VERSION=dev
ENV APP_VERSION=${APP_VERSION} PORT=8080 PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
USER 10001
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request,sys; urllib.request.urlopen('http://127.0.0.1:8080/healthz'); sys.exit(0)"
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "app:app"]
