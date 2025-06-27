FROM node:22-alpine as base


ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PATH}:${PNPM_HOME}"
RUN corepack enable && pnpm i -g turbo@^2

FROM base AS dev

WORKDIR /app

COPY . .

RUN pnpm install --frozen-lockfile

CMD ["pnpm", "run", "dev"]

FROM base AS prod

WORKDIR /app

COPY . .

RUN pnpm install --frozen-lockfile
RUN turbo build --filter=app

CMD ["pnpm", "run", "start"]