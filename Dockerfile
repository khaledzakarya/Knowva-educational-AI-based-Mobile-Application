FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Copy Prisma schema early so postinstall works
COPY prisma ./prisma

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build app
RUN npm run build

EXPOSE 3000

CMD ["node", "dist/main.js"]
