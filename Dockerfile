FROM golang:alpine AS build
RUN apk add --no-cache git~=2.22  unzip~=6.0
RUN apk add --no-cache --virtual .build-dependancies git~=2.22 \
    && go get github.com/pivotal-cf/cred-alert \
    && go get github.com/golang/dep/cmd/dep \
    && go install github.com/golang/dep/cmd/dep \
    && go install github.com/pivotal-cf/cred-alert
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip \
    && unzip terraform_0.12.12_linux_amd64.zip
RUN wget --quiet https://github.com/wata727/tflint/releases/download/v0.12.1/tflint_linux_amd64.zip \
    && unzip tflint_linux_amd64.zip

FROM golang:alpine
ENV CGO_ENABLED=0
RUN apk update && apk add --no-cache ca-certificates=20190108-r0
COPY --from=build /go/bin/dep /usr/bin
COPY --from=build /go/terraform /usr/bin
COPY --from=build /go/tflint /usr/bin
COPY --from=build /go/bin/cred-alert /usr/bin
RUN apk add --no-cache jq~=1.6 python3~=3.7.5 openssh=8.1_p1-r0 git~=2.22.0 && pip3 install --no-cache-dir detect-secrets==0.12.7
WORKDIR /go/src/workdir
