FROM node:18-bullseye

# Instalar dependencias del sistema para Puppeteer y Chromium
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1 \
    libxcb-dri3-0 \
    libgbm1 \
    libxshmfence1 \
    && rm -rf /var/lib/apt/lists/*

# Crear carpeta de trabajo
WORKDIR /data

# Instalar n8n y dependencias en el mismo contexto
RUN npm init -y && \
    npm install n8n puppeteer puppeteer-extra \
    puppeteer-extra-plugin-stealth \
    puppeteer-extra-plugin-user-data-dir \
    puppeteer-extra-plugin-user-preferences \
    n8n-nodes-puppeteer

# Variables de entorno
ENV N8N_CUSTOM_EXTENSIONS=/data/node_modules/n8n-nodes-puppeteer

# Exponer puerto
EXPOSE 5678

# Comando de ejecución
CMD ["npx", "n8n"]
