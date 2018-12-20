FROM golang:1.11 as promtool-builder

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go get -u github.com/prometheus/prometheus/cmd/promtool

FROM alpine:3.8

COPY --from=promtool-builder /go/bin/promtool /usr/bin/
ENTRYPOINT ["/usr/bin/promtool"]
