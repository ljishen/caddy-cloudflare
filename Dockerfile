# syntax=docker/dockerfile:1
#
# See the "Adding custom Caddy modules" section in the discription of the caddy
# docker official image: https://hub.docker.com/_/caddy?tab=description

FROM caddy:builder AS builder

RUN xcaddy build \
		--with github.com/caddy-dns/cloudflare

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
