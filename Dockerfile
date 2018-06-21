FROM nginx:alpine

COPY index.html /usr/share/nginx/html/docs/
COPY OpenAPI.yaml /usr/share/nginx/html/docs/