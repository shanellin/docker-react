#--- Use an existing docker image as a base
FROM node:12.22.12-alpine

#--- Download and install a dependency
WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN NODE_ENV=develop npm i

COPY . .

#--- Tell the image what to do when is starts
CMD ["npm", "run", "start"]