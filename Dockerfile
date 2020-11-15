# https://github.com/vercel/next.js/blob/canary/examples/with-docker/Dockerfile.multistage
FROM mhart/alpine-node
ARG GITHUB_CLIENT_ID=${GITHUB_CLIENT_ID}
ARG BASE_REPO_FULL_NAME=${BASE_REPO_FULL_NAME}
ARG GITHUB_CLIENT_SECRET=${GITHUB_CLIENT_SECRET}
ARG SIGNING_KEY=${SIGNING_KEY}
ARG GTM_ID=${GTM_ID}

COPY package.json ./
RUN yarn cache clean
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start"]
