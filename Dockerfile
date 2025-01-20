# Étape 1 : Construction de l'application Angular
FROM node:18 AS build

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . /app

RUN npm run build --prod

# Étape 2 : Utiliser Nginx pour servir l'application
FROM nginx:alpine

COPY --from=build /app/dist/task-board-pro/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
