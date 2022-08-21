#!/bin/sh -ex

cd ${CODEBUILD_SRC_DIR}/example
terraform init -input=false -no-color
terraform plan -input=false -no-color | tfnotify --config ${CODEBUILD_SRC_DIR}/tfnotify-plan.yml plan