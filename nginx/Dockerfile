FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY fix-permissions.sh /fix-permissions.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /fix-permissions.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
