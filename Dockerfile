FROM node:22-alpine3.18 as builder
WORKDIR '/app/frontend'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/frontend/build /usr/share/nginx/html
