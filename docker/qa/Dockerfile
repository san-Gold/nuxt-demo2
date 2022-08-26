FROM node:16.16.0 as deps

WORKDIR /app
COPY package.json package-lock.json .npmrc ./
RUN npm config set unsafe-perm true && npm install --registry https://registry.npm.taobao.org
# npm 出于安全考虑不支持以 root 用户运行，即使你用 root 用户身份运行了，npm 会自动转成一个叫 nobody 的用户来运行，而这个用户几乎没有任何权限。这样的话如果脚本里有一些需要权限的操作，比如写文件，就会报401.

FROM node:16.16.0-alpine as builder

ENV APP_ENV=qa

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY . .
RUN npm run build

FROM node:16.16.0-alpine

WORKDIR /app

COPY --from=builder /app  .

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "yarn", "start" ]