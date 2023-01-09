FROM golang:1.19-alpine AS build

ARG CGO_ENABLED=1
ENV CGO_ENABLED ${CGO_ENABLED}

WORKDIR /src/
COPY . /src/
RUN go build -o /bin/api_server main.go

FROM scratch

COPY --from=build /bin/api_server /bin/api_server
EXPOSE 9003/tcp
ENTRYPOINT ["/bin/api_server"]