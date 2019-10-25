# docker-terraform-ci

Dockerfile to build terraform CI docker images.

## Content

- terraform
- cred-alert
- tflint
- detect-secrets
## How to run

- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support terraform init
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support terraform fmt -check=true
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support terraform validate
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support cred-alert scan -f .
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support tflint
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-12-support detect-secrets scan
