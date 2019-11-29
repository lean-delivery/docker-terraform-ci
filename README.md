# docker-terraform-ci

Dockerfile to build terraform CI docker images.

## Content

- terraform
- cred-alert
- tflint
- detect-secrets
- go
- dep 

## How to run

- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support terraform init
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support terraform fmt -check=true
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support terraform validate
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support cred-alert scan -f .
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support tflint
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support detect-secrets scan
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/ -t leandelivery/docker-terraform-ci:tf-12-support go version

## Run terratest tests
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/test/ -t leandelivery/docker-terraform-ci:tf-12-support dep ensure
- docker run --rm -v $(pwd):/go/src/workdir/ --workdir=/go/src/workdir/test/ -t leandelivery/docker-terraform-ci:tf-12-support go test -v -timeout 90m .
