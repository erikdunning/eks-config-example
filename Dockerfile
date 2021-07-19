 FROM node:16-alpine
 WORKDIR /app
 COPY node_modules ./node_modules
 COPY dist/index.js ./index.js
 EXPOSE 3000
 CMD ["node", "index.js"]
