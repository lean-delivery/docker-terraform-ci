FROM golang:alpine AS build
RUN apk add --no-cache git
RUN go get github.com/segmentio/terraform-docs
RUN go get github.com/pivotal-cf/cred-alert
RUN wget --quiet https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip \
    && unzip terraform_0.11.11_linux_amd64.zip
RUN wget --quiet https://github.com/wata727/tflint/releases/download/v0.7.4/tflint_linux_amd64.zip \
    && unzip tflint_linux_amd64.zip


FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build /go/terraform /usr/bin
COPY --from=build /go/bin/terraform-docs /usr/bin
COPY --from=build /go/tflint /usr/bin
COPY --from=build /go/bin/cred-alert /usr/bin
RUN apk add --no-cache python3 && apk add --no-cache git
RUN pip3 install --no-cache-dir terrascan tf-readme-validator
