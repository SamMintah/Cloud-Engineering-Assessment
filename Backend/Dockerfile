# Use a lightweight Node.js image
FROM node:16-slim

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the backend port
EXPOSE 3000

# Start the Node.js server
CMD ["npm", "start"]
