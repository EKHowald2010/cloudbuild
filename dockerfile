FROM node:14

# Specify the working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Install app dependencies, including 'googleapis'
RUN npm install && npm install googleapis

# Copy the rest of the application
COPY . .

# Expose the port on which the app will run
EXPOSE 8080

# Specify Node.js version in package.json
RUN echo '{ "engines": { "node": "14.x" } }' > package.json

# Health check endpoint
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:8080/health || exit 1

# Start the application with the health check
CMD [ "npm", "start" ]
