FROM node:24.14.1-alpine
WORKDIR /expressjs-api
COPY package.json package-lock.json ./
RUN npm ci
COPY index.js ./
CMD [ "npm", "start" ]