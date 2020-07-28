#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr docker \
    --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base \
    --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-rubybase \
    --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-swiftbase \
    --version ${VERSION} \
    --repo https://github.com/rajattyagipvr/jenkins-x-builders.git \
    --repo https://github.com/rajattyagipvr/jenkins-x-builders-ml.git

jx step create pr regex \
    --regex '\s+-\s--image=702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:(.*)' \
    --regex '\s+-\s--image=702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-rubybase:(.*)' \
    --regex '\s+-\s--image=702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-swiftbase:(.*)' \
    --version ${VERSION} \
    --files jenkins-x.yml \
    --repo https://github.com/rajattyagipvr/jenkins-x-builders.git \
    --repo https://github.com/rajattyagipvr/jenkins-x-builders-ml.git
