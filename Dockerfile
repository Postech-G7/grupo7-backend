FROM node:20
USER root
WORKDIR /home/node/app
COPY package.json pnpm-lock.yaml ./
COPY tsconfig.json .
COPY src ./src
RUN npm install -g pnpm
RUN pnpm install
RUN pnpm tsx ./src/swagger.ts
ENV NODE_ENV=production
ENV PORT=3000

ENV MERCADO_PAGO_USERID=140225549
ENV MERCADO_PAGO_TOKEN=TEST-6171745819014663-071918-e3d8f1680321deab4a8c0e430c211de3-140225549
ENV MERCADO_PAGO_WEBHOOK_URL=https://fiap.com.br 
ENV MERCADO_PAGO_POS=2797
ENV MERCADO_PAGO_URL=https://api.mercadopago.com

EXPOSE 3000
CMD [ "pnpm", "start"]
