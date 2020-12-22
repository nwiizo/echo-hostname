FROM golang:latest AS builder
WORKDIR /work
COPY main.go .
COPY go.mod .
RUN go build -o echo-hostname .

FROM ubuntu:21.04
COPY --from=builder /work/echo-hostname .
EXPOSE 8080
CMD /echo-hostname
