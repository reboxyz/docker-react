# The build phase tag as 'builder'
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Note! /app/build is the complete path of the result of 'npm run build'

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Note! nginx default port is 80



