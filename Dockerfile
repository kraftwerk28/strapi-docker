FROM node:11.15.0

RUN yarn global add strapi@beta

WORKDIR /opt/
ENV \
  DB_CLIENT=postgres \
  DB_HOST=postgres \
  DB_PORT=5432 \
  DB_NAME=strapi \
  DB_USER=strapi_user \
  DB_PASSWORD=strapi_pwd
RUN strapi new app \
  --dbclient=${DB_CLIENT} \
  --dbhost=${DB_HOST} \
  --dbport=${DB_PORT} \
  --dbname=${DB_NAME} \
  --dbusername=${DB_USER} \
  --dbpassword=${DB_PASSWORD}

WORKDIR /opt/app/
CMD [ "yarn", "develop" ]
