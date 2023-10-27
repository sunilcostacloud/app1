# Use an official Node runtime as the base image
FROM node:16.18.0 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Use a lightweight Node runtime as the final base image
FROM node:16.18.0-slim

# Set the working directory
WORKDIR /app

# Copy the built application from the "build" stage to the final image
COPY --from=build /app/dist ./dist

# Install a simple web server to serve the application
RUN npm install -g serve

# Expose the port on which the application will run (adjust as needed)
EXPOSE 8081

# Define the command to start the web server
CMD ["serve", "-s", "dist", "-p", "8081"]
