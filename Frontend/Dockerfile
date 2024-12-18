# Stage 1: Build the frontend app
FROM node:16 AS builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build 

# Stage 2: Serve the frontend app using NGINX
FROM nginx:alpine

# Copy the build output from the builder stage to NGINX's HTML directory
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
