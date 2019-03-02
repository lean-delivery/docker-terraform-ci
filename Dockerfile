FROM golang:alpine AS build
RUN apk add --no-cache git
RUN go get github.com/segmentio/terraform-docs

FROM alpine
COPY --from=build /go/bin/terraform-docs /usr/bin
RUN apk add --no-cache py-pip
RUN pip install --upgrade pip
RUN pip install tf-readme-validator
