FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN rm -rf node_modules
RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

VOLUME /var/videos

EXPOSE 5000
CMD [ "node", "--harmony", "lib/index.js", "-d", "/var/videos"]
