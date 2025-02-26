FROM klakegg/hugo:0.101.0-ext-ubuntu-onbuild AS hugo

FROM nginx:alpine
COPY --from=hugo /target /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
