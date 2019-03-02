FROM golang:alpine AS build
RUN apk add --no-cache git
RUN go get github.com/pivotal-cf/cred-alert

FROM alpine
COPY --from=build /go/bin/cred-alert /usr/bin
