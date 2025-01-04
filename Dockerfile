# Step 1: Build klijent (React aplikacija)
FROM node:18 AS client-builder
WORKDIR /app/client
COPY client/package.json client/yarn.lock ./
RUN yarn install

# Dodaj NODE_OPTIONS pre build komande
ENV NODE_OPTIONS=--openssl-legacy-provider

COPY client/ ./
RUN yarn build

# Step 2: Postavi server (Node.js sa Socket.io)
FROM node:18 AS server
WORKDIR /app
COPY server/package.json server/yarn.lock ./
RUN yarn install
COPY server/ .
COPY --from=client-builder /app/client/build ./build
EXPOSE 5000
CMD ["node", "index.js"]
