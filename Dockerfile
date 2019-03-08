FROM node:alpine as code-build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=code-build /app/build /usr/share/nginx/html
