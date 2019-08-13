FROM node:11.15.0

# RUN apk add --update build-essential
RUN yarn global add strapi@beta

WORKDIR /opt/
ARG DB_CLIENT=postgres
ARG DB_HOST=postgres
ARG DB_PORT=5432
ARG DB_NAME=strapi
ARG DB_USER=strapi_user
ARG DB_PASSWORD=strapi_pwd
RUN strapi new app \
  --dbclient=${DB_CLIENT} \
  --dbhost=${DB_HOST} \
  --dbport=${DB_PORT} \
  --dbname=${DB_NAME} \
  --dbusername=${DB_USER} \
  --dbpassword=${DB_PASSWORD}

WORKDIR /opt/app/
# RUN yarn build
# CMD [ "yarn", "start" ]
CMD [ "yarn", "develop" ]
