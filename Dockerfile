FROM node:16 AS development

# set working directory
WORKDIR /melo_rafael_site

# add `/app/node_modules/.bin` to $PATH
ENV PATH /melo_rafael_site/node_modules/.bin:$PATH

# install app dependencies

COPY package.json ./
COPY package-lock.json ./

RUN npm config set unsafe-perm true
RUN npm install --silent

COPY . .

EXPOSE 7775

# start app
CMD ["npm", "run", "start"]