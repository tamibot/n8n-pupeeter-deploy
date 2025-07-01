FROM node:18-bullseye

# Instalar dependencias del sistema para Chromium
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

# Crear carpeta para datos de n8n
WORKDIR /home/node/.n8n

# Instalar n8n globalmente
RUN npm install -g n8n

# Instalar Puppeteer y sus plugins en la carpeta de nodos custom
RUN mkdir -p /home/node/.n8n/nodes && cd /home/node/.n8n/nodes && \
    npm init -y && \
    npm install puppeteer puppeteer-extra \
    puppeteer-extra-plugin-stealth \
    puppeteer-extra-plugin-user-data-dir \
    puppeteer-extra-plugin-user-preferences \
    n8n-nodes-puppeteer

# Exponer el puerto
EXPOSE 5678

# Comando para correr n8n
CMD ["n8n"]
