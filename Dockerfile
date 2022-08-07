FROM alpine:3.16.1 as build

WORKDIR /source

RUN apk add --update cmake make g++

COPY source .

RUN cmake -S . -B . \
      -DCMAKE_BUILD_TYPE=Release \
    && cmake --install . --strip \
    && cmake --build . --config Release

FROM alpine:3.16.1 as service

RUN apk add --update libstdc++

WORKDIR /app

COPY --from=build /source/Core /app
COPY docker/entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
