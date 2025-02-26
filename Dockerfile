FROM alpine:3.18 AS builder

# Install Hugo
RUN apk add --no-cache hugo=0.101.0-r0

# Set up build directory
WORKDIR /src
COPY . .

# Build the site
RUN hugo --minify

# Final stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
