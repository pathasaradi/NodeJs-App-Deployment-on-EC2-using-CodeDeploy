# Stage 1: Build
FROM public.ecr.aws/docker/library/node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2: Runtime
FROM public.ecr.aws/docker/library/node:18-slim

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000
CMD ["node", "server.js"]
