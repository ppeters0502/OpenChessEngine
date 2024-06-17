FROM nginx
COPY frontend /usr/share/nginx/html
VOLUME /usr/share/nginx/html