# Run (tests): docker build -t flattenize .
# Remove: docker rmi flattenize

FROM bitwalker/alpine-elixir:1.12.3

COPY . .

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

RUN rm -Rf _build && \
    MIX_ENV=test mix do deps.get, deps.compile, test
