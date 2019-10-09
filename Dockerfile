FROM golang:alpine AS build
RUN apk add --no-cache git=2.22.0-r0  unzip=6.0-r4
RUN apk add --no-cache --virtual .build-dependancies git=2.22.0-r0 \
    && go get github.com/pivotal-cf/cred-alert \
    && go install github.com/pivotal-cf/cred-alert
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip \
    && unzip terraform_0.12.9_linux_amd64.zip
RUN wget --quiet https://github.com/wata727/tflint/releases/download/v0.11.2/tflint_linux_amd64.zip \
    && unzip tflint_linux_amd64.zip

FROM alpine:3.10

RUN apk update && apk add --no-cache ca-certificates=20190108-r0
COPY --from=build /go/terraform /usr/bin
COPY --from=build /go/tflint /usr/bin
COPY --from=build /go/bin/cred-alert /usr/bin
RUN apk add --no-cache python3=3.7.4-r0 openssh=8.0_p1-r0 git=2.22.0-r0 && pip3 install --no-cache-dir detect-secrets==latest

