# Use an official Node.js runtime as the base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Expose a port (e.g., 3000) that your app listens on
EXPOSE 3000

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies using `npm ci` for consistency
RUN npm ci

# Copy the rest of the application code
COPY . .

# Define the command to run your app
CMD [ "npm", "start" ]