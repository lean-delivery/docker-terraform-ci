FROM golang:alpine AS build
RUN apk add --no-cache git
RUN go get github.com/segmentio/terraform-docs
RUN go get github.com/pivotal-cf/cred-alert
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip \
    && unzip terraform_0.12.9_linux_amd64.zip
RUN wget --quiet https://github.com/wata727/tflint/releases/download/v0.11.2/tflint_linux_amd64.zip \
    && unzip tflint_linux_amd64.zip


FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build /go/terraform /usr/bin
COPY --from=build /go/bin/terraform-docs /usr/bin
COPY --from=build /go/tflint /usr/bin
COPY --from=build /go/bin/cred-alert /usr/bin
RUN apk add --no-cache python3 openssh git && pip3 install --no-cache-dir tf-readme-validator
