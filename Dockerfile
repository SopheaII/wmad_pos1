FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package files first (to leverage Docker cache)
COPY package*.json ./

# Install dependencies
RUN npm install --force
# Run database generation and build the Next.js app
RUN npm run db:generate && npm run build

COPY . .

# Start the Next.js application
CMD ["npm", "run", "start"]
