#!/bin/bash -ex

REGISTRY_URI="225807588176.dkr.ecr.us-west-2.amazonaws.com"
CONTAINER_NAME="terraform"
IMAGE_TAG="0.0.1"
REPOSITORY_URI=${REGISTRY_URI}/${CONTAINER_NAME}

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $REGISTRY_URI
aws ecr create-repository --repository-name ${CONTAINER_NAME} --region us-west-2 || true
docker build -t $REPOSITORY_URI:$IMAGE_TAG .
docker tag $REPOSITORY_URI:$IMAGE_TAG $REPOSITORY_URI:latest
docker push $REPOSITORY_URI:$IMAGE_TAG
docker push $REPOSITORY_URI:latest
