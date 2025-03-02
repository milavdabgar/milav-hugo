FROM alpine:3.18 AS builder

# Install Hugo (no Git needed since we're cloning properly)
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

# Set up build directory
WORKDIR /src
COPY . .

# Build the site (submodules already handled by git clone --recursive)
RUN hugo --minify

# Final stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf