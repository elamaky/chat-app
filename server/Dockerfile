# Odaberi Node.js kao osnovnu sliku
FROM node:16

# Postavi radni direktorijum
WORKDIR /usr/src/app

# Kopiraj package.json i package-lock.json
COPY server/package*.json ./

# Instaliraj zavisnosti
RUN npm install

# Kopiraj sve iz server direktorijuma
COPY server/ .

# Pokreni server
CMD ["node", "server.js"]
