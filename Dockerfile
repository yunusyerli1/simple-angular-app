# stage 1
FROM node:22.5-slim as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/simple-angular-app/browser /usr/share/nginx/html