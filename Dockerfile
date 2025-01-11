FROM node:20

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --force

COPY . .

# Run db:generate before starting the app

CMD ["sh", "-c", "npm run db:generate && npm run build && npm run start"]
