FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

# Install app dependencies, including 'googleapis'
RUN npm install && npm install googleapis

# Copy the rest of the application
COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
