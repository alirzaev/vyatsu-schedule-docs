FROM nginx:alpine

COPY index.html /usr/share/nginx/html
COPY OpenAPI.json /usr/share/nginx/html