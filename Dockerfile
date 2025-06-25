FROM caddy:latest

COPY conf/Caddyfile /etc/caddy/Caddyfile
COPY site /srv
