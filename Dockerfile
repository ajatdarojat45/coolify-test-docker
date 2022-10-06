FROM node:16.13

WORKDIR /usr/local/app

ENV PORT=4002

COPY package.json package-lock.json /usr/local/app/

RUN npm install && npm cache clean --force

COPY ./ ./

RUN npm install -g nodemon

RUN npm install sequelize-cli

RUN npm run db_create

RUN npm run db_migrate

RUN npm run db_seed

CMD [ "npm", "run", "start" ]
