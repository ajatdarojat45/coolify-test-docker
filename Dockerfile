FROM node:16.13

WORKDIR /usr/local/app

ENV PORT=4002

COPY package.json package-lock.json /usr/local/app/

RUN npm install && npm cache clean --force

COPY ./ ./

RUN npm install -g nodemon

CMD [ "npm", "run", "db_create"]

CMD [ "npm", "run", "db_migrate" ]

CMD [ "npm", "run", "db_seed"]

CMD [ "npm", "run", "start" ]
