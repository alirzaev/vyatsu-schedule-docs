FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY specification.yml /usr/share/nginx/html/
