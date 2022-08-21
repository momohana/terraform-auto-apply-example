#!/bin/sh -ex

cd ${CODEBUILD_SRC_DIR}/example
terraform init -input=false -no-color
terraform apply -input=false -no-color -auto-approve
