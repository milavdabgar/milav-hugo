FROM debian:bullseye-slim AS builder

# Install Hugo
RUN apt-get update && apt-get install -y hugo git

# Set up build directory
WORKDIR /src
COPY . .

# Build the site
RUN hugo --minify

# Final stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
