FROM caddy:latest

COPY conf/Caddyfile /etc/caddy/Caddyfile
COPY site /srv

EXPOSE 80
EXPOSE 443
