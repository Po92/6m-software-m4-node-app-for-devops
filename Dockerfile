# Use a stable Node.js runtime as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Set the environment variable for the port
ENV PORT=3000

# Copy package.json and package-lock.json first to leverage Docker's cache
COPY ["package.json", "package-lock.json*", "./"]

# Use `npm ci` for a clean and consistent install, ideal for CI/CD
RUN npm ci

# Copy the rest of the application code
COPY . .

# Expose the port your application listens on
EXPOSE 3000

# Define the command to run your app
CMD [ "npm", "start" ]