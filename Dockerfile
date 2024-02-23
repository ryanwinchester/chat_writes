ARG ELIXIR_VERSION=1.16.1
ARG OTP_VERSION=26.2
ARG DEBIAN_VERSION=buster-20231009-slim

ARG IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"

FROM ${IMAGE}

# Install build dependencies.
RUN apt-get update -y && apt-get install -y build-essential git \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Prepare build dir.
WORKDIR /app

# Install hex + rebar.
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy config.
RUN mkdir config

COPY config/runtime.exs config/
COPY lib lib
COPY mix.exs mix.lock ./

# Install mix dependencies.
RUN mix deps.get
RUN mix deps.compile

# Compile the release.
RUN mix compile
