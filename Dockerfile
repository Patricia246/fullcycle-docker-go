FROM golang:1.11.2-alpine

WORKDIR /go/src/app

COPY . .

RUN go get -v ./...
RUN go build
FROM scratch
WORKDIR /home

COPY --from=0 /go/src/app/app .
CMD ["./app"]