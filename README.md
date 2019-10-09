# docker-terraform-ci

Dockerfile to build terraform CI docker images.

## Content

- terraform
- cred-alert
- tflint
- detect-secrets
## How to run

- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform init
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform fmt -check=true
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform validate
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci cred-alert scan -f .
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci tflint --error-with-issues
