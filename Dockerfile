# Use latest Ubuntu image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    gnupg \
    software-properties-common \
    curl \
    unzip \
    wget \
    lsb-release \
    gpg

# Add HashiCorp GPG key and repository
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
RUN apt-get update && \
    apt-get install -y terraform && \
    terraform -install-autocomplete

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Verify installations
RUN terraform -version && aws --version

# Set working directory
WORKDIR /workspace