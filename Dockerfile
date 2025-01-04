# Step 1: Build klijent (React aplikacija)
FROM node:18 AS client-builder
WORKDIR /app
COPY client/package.json client/yarn.lock ./   # Promeni klijent u client
RUN yarn install
COPY client/ .   # Promeni klijent u client
RUN yarn build

# Step 2: Postavi server (Node.js sa Socket.io)
FROM node:18 AS server
WORKDIR /app
COPY server/package.json server/yarn.lock ./
RUN yarn install
COPY server/ .
COPY --from=client-builder /app/build ./build
EXPOSE 5000
CMD ["node", "index.js"]

