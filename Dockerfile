# Usa una imagen oficial de Node.js
FROM node:20-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de dependencias
COPY package*.json ./
COPY bun.lockb ./
COPY pnpm-lock.yaml ./
COPY yarn.lock ./

# Instala las dependencias (ajusta según tu gestor)
RUN npm install

# Copia el resto del código
COPY . .

# Construye la aplicación
RUN npm run build

# Expone el puerto por defecto de Nuxt
EXPOSE 3000

# Comando para iniciar la app en producción
CMD ["npm", "run", "start"]