FROM nginx:alpine

COPY index.html /usr/share/nginx/html/docs/
COPY OpenAPI.json /usr/share/nginx/html/docs/