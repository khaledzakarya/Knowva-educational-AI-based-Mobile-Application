FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build app
RUN npm run build

EXPOSE 3000

# Run migrations and then start the app
CMD npx prisma migrate deploy --schema=prisma/schema.prisma && node dist/main.js
