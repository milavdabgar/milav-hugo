# Build stage
FROM klakegg/hugo:0.101.0-ext-ubuntu as builder

WORKDIR /src
COPY . .
RUN hugo --minify

# Run stage
FROM nginx:alpine

COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
