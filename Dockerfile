FROM node:20

WORKDIR /app

# Actualizar el sistema y las herramientas de construcción necesarias
RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
  sqlite3 \
  --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Copia el package.json y el package-lock.json
COPY package*.json ./

RUN if [ ! -d "node_modules" ]; then npm install; fi

# Copia el resto de la aplicación
COPY . .

# Inicia la aplicación
CMD ["node", "app.js"]
