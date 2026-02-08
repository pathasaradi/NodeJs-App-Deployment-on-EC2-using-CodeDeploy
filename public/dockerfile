# Stage 1: Build
FROM node:18 AS builder

WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy full application source
COPY . .

# Stage 2: Runtime
FROM node:18-slim

WORKDIR /app

# Copy app from builder stage
COPY --from=builder /app .

# Expose port (change if your server uses a different port)
EXPOSE 3000

# Start Node.js app
CMD ["node", "server.js"]
