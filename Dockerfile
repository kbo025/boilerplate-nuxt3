# Build Stage 1

FROM node:22-alpine AS build
WORKDIR /app

# Copia los archivos necesarios para instalar dependencias
COPY package.json package-lock.json ./

# Instala dependencias
RUN npm ci

# Copia el resto del proyecto
COPY . ./

# Construye el proyecto
RUN npm run build && ls -la /app/.output
RUN ls -la /app

# Build Stage 2

FROM node:22-alpine
WORKDIR /app

# Solo se necesita la carpeta .output del build
COPY --from=build /app/.output/ ./

# Cambia el puerto y host
ENV PORT=8080
ENV HOST=0.0.0.0

EXPOSE 8080

CMD ["node", "/app/server/index.mjs"]