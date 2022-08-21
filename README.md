# terraform-auto-apply-example

Example of how to run apply automatically in Terraform.
The tf file in the example directory will be applied automatically.

# Usage

Create a container image for Terraform.

Change the REGISTRY_URI in docker-build.sh to match your environment.
REGISTRY_URI depends on your ECR environment.

Run docker-build.sh.
An container image will be created in the ECR.

```sh
$ ./docker-build.sh
```

Run terraform.

```sh
$ terraform init
$ terraform apply
```
