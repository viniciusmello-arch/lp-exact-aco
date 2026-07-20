# Landing page da Exact Aço — servidor Node (Express) que serve o estático
# e faz proxy do lead pro CRM. Deploy na Railway.
FROM node:20-alpine

WORKDIR /app
ENV NODE_ENV=production

# Deps primeiro (cache de camada).
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev || npm install --omit=dev

# Código + estático.
COPY . .

EXPOSE 3000
CMD ["node", "server.js"]
