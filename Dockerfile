FROM node:16.18.1 as build-stage
RUN npm i -g pnpm@7.28.0 --registry=https://registry.npm.taobao.org/
WORKDIR /app
COPY package.json pnpm-lock.yaml /app/
RUN pnpm i
COPY . .
RUN pnpm build

# production stage
FROM nginx:1.20.2-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html