# Caddy Server
A webserver that serves static files, reverse proxies, and more, with automatic HTTPS support.

## Data mount points
### `:/etc/caddy`
This directory is used for Caddy's configuration files, including the main Caddyfile and any additional configuration files.


### `:/site/`
This directory is used for static files that Caddy will serve. You can place your HTML, CSS, JavaScript, and other static assets here.


### `:/data/`
This directory is used by Caddy to store its data, such as certificates and other runtime data. It is important to persist this directory to ensure that your certificates are not lost when the container is stopped or removed.

More on https://caddyserver.com/docs/conventions#data-directory

### `:/config/`
This directory is used to store Caddy's configuration files to disk

More on https://caddyserver.com/docs/conventions#configuration-directory


## Environment variables
### `BE_DOMAIN_ADDRESS`

This variable sets the domain address of the backend service. e.g `localhost` or `example.com`

### `BE_REALTIME_ADDRESS`
This variable sets the address of the electricsql sync service for real-time communication

### `BE_GATEWAY_ADDRESS`
This variable sets the address of the backend gateway service. This is typically used for API requests.


## Setup
### Running Caddy using Dockerfile (Adjust ports as needed)
```
docker run -d \
  --name caddy \
  -p 80:80 \
  -p 443:443 \
  -e BE_DOMAIN_ADDRESS=localhost \
  -e BE_REALTIME_ADDRESS=host.docker.internal:3001 \
  -e BE_GATEWAY_ADDRESS=host.docker.internal:8000 \
  -v "$(pwd)/conf:/etc/caddy" \
  -v "$(pwd)/site:/srv" \
  -v caddy_data:/data \
  -v caddy_config:/config \
  caddy
```

### Running Caddy locally
##### Set correct env ports on docker-compose.yml
```
vi docker-compose.yml

BE_DOMAIN_ADDRESS
BE_REALTIME_ADDRESS
BE_GATEWAY_ADDRESS
```

##### Run Caddy web server with Docker Compose
```
docker-compose up -d
```

