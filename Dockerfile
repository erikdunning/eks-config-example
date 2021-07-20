 FROM node:16-alpine AS base

 WORKDIR /app

 FROM base AS installer


 FROM installer AS build

 COPY node_modules ./node_modules
 COPY dist/index.js ./index.js
 EXPOSE 3000
 
 CMD ["node", "index.js"]
