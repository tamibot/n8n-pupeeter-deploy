# n8n Puppeteer Deploy

Repositorio para desplegar una instancia de n8n con soporte para Puppeteer utilizando Docker.

## 🚀 Deploy

1. Clona este repositorio
2. Configura tus variables de entorno en Railway o en un archivo `.env`
3. Railway detectará automáticamente el Dockerfile y hará el build

## 🛠 Variables necesarias

- `N8N_BASIC_AUTH_USER`
- `N8N_BASIC_AUTH_PASSWORD`
- `N8N_HOST` (por defecto `0.0.0.0`)
- `N8N_PORT` (por defecto `5678`)
- `WEBHOOK_URL` (el dominio generado por Railway)
- `N8N_RUNNERS_ENABLED` (`true` recomendado)

## 🐳 Docker

```bash
docker build -t n8n-puppeteer .
docker run -it -p 5678:5678 --env-file .env n8n-puppeteer
```
