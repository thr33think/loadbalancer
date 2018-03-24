# Loadbalancer

## Usage

To register your container with the loadbalancer your `docker-compose` file needs the following:

- Labels
- Networks

### Labels

> Mandatory:
>- traefik.enable=true
>- traefik.backend
>- traefik.port
>- traefik.frontend.rule

For more options, check the [docs](https://docs.traefik.io/configuration/backends/docker/#on-containers)

Example

```yaml
labels:
      - "traefik.enable=true"
      - "traefik.backend=lb" # Name of backend
      - "traefik.port=8080"
      - "traefik.frontend.rule=Host:lb.andimenge.de"
      - "traefik.frontend.passHostHeader=true"
      - "traefik.frontend.auth.basic=<user>:<pw>" # escape $ with another $
```

### Networks

```yaml
    networks:
      - production

networks:
  production:
    external: true
```

## Build and Deploy

- `make` Build docker image and publish to dockerhub
- `make deploy` deploy to server (**Only works when docker client is pointed to remote dockerd**)