# Use a Node.js base image matching the version on your EC2
FROM node:13

# Set environment variables if necessary
ENV HOME=/home/node

# Create and set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY src/node-app/package*.json ./
RUN npm install

# Copy the rest of the application
COPY src/node-app .

# Expose the port your application uses (adjust if necessary)
EXPOSE 3000

# Command to run your Node.js application
CMD ["node", "app.js"]
