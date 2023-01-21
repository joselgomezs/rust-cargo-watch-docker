FROM rust:alpine3.16 AS builder

ARG APP_NAME="default-cargo-watch-app-name"
ENV APP_NAME=${APP_NAME}
WORKDIR /app/${APP_NAME}

COPY ./Cargo.toml ./Cargo.toml
COPY ./src ./src

RUN apk add --no-cache musl-dev
RUN cargo install cargo-watch

ENTRYPOINT ["cargo", "watch", "--poll", "-x", "run"]