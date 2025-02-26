FROM debian:bullseye-slim AS builder

# Install Hugo
RUN apt-get update && apt-get install -y curl && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v0.125.7/hugo_0.125.7_linux-amd64.deb -o hugo.deb && \
    dpkg -i hugo.deb && \
    rm hugo.deb

# Set up build directory
WORKDIR /src
COPY . .

# Build the site
RUN hugo --minify

# Final stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
