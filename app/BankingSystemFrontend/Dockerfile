# Stage 1: Build the Angular app
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies with legacy peer deps flag
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Build the Angular app with OpenSSL legacy provider
RUN NODE_OPTIONS="--openssl-legacy-provider" npm run build -- --configuration production

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the built app to nginx
COPY --from=builder /app/dist/* /usr/share/nginx/html/

# Copy custom nginx config if you have one
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
