#--- Use an existing docker image as a base
FROM node:12.22.12-alpine as builder

#--- Download and install a dependency
WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN NODE_ENV=develop npm i

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
