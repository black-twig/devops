# The first thing we need to do is define from what image we want to build from. 
# Here we will use the latest LTS (long term support) version 16 of Node 
# available from the Docker Hub:
FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# When building code for production use
# RUN npm ci --only=production

# Bundle app source inside the Docker image
COPY . .

# app binds to port 8080 
# so use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 8080

# define the command to run your app using CMD which defines your runtime. 
# Here we will use node server.js to start your server:
CMD [ "node", "server.js" ]
