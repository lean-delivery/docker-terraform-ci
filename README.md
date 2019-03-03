# docker-terraform-ci

Dockerfile to build terraform CI docker images.

## Content

- cred-alert

## How to run

- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t hashicorp/terraform:latest init
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t hashicorp/terraform:latest fmt -check=true
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t hashicorp/terraform:latest validate -check-variables=false
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:tf-readme-validator tf_readme_validator.py
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t leandelivery/docker-terraform-ci:cred-alert cred-alert scan -f .
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t wata727/tflint --error-with-issues
- docker run --rm -v $(pwd):/work/ --workdir=/work/ -t tmknom/terrascan --location . --test all
