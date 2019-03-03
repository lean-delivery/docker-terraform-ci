# docker-terraform-ci

Dockerfile to build terraform CI docker images.

## Content

- terraform
- cred-alert
- tflint
- terrascan
- tf-readme-validator

## How to run

- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform init
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform fmt -check=true
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terraform validate -check-variables=false
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci tf_readme_validator.py
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci cred-alert scan -f .
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci tflint --error-with-issues
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci terrascan --location . --test all
