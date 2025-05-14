
Terraform & AWS CLI Docker Image
================================

This Docker image is based on `ubuntu:latest` and includes the following tools:

- Terraform (https://www.terraform.io/)
- AWS CLI v2 (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

Features
--------

- Uses the official `ubuntu:latest` as a base image
- Installs Terraform from the official HashiCorp APT repository
- Installs AWS CLI v2 from the official installer
- Includes essential dependencies (`curl`, `unzip`, `gnupg`, etc.)
- Autocomplete for Terraform enabled

Prerequisites
-------------

- Docker (https://www.docker.com/products/docker-desktop) installed

Build the Docker Image
----------------------

Clone the repository (or save the Dockerfile locally) and build the image:

```bash
docker build -t terraform-awscli .
```

Run the Container
-----------------

To start a container with an interactive shell:

```bash
docker run -it terraform-awscli
```

To mount a local working directory (e.g., for using your Terraform configuration):

```bash
docker run -it -v $(pwd):/workspace terraform-awscli
```

Verify Installed Tools
----------------------

Inside the container, you can verify the tools:

```bash
terraform -version
aws --version
```

License
-------

This project is open-source and available under the MIT License (https://opensource.org/licenses/MIT).
