FROM node:22

WORKDIR /var/www/html

COPY yarn.lock package.json ./

COPY . .

RUN yarn install

#EXPOSE 3000

CMD ["yarn", "watch"]