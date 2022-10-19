FROM golang:alpine as builder

WORKDIR /usr/src/app
COPY src/go.* ./
RUN go mod download
COPY src/*.go ./
RUN go build -o /hello

ENTRYPOINT ["/hello"]


FROM scratch

WORKDIR /usr/src/app
COPY --from=builder hello ./

ENTRYPOINT [ "./hello" ]