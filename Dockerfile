FROM alpine:3.18 AS builder

# Install Git and Hugo
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo git

# Set up build directory
WORKDIR /src
COPY . .

# If using submodules, make sure they're initialized
RUN git submodule update --init --recursive

# Build the site
RUN hugo --minify

# Final stage
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf