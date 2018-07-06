FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY OpenAPI.yaml /usr/share/nginx/html/
