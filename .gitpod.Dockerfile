# Use the base Gitpod image
FROM gitpod/workspace-full

# Install required dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install LocalStack and awscli-local
RUN pip3 install localstack awscli-local flake8

# Set environment variables for LocalStack
ENV SERVICES="s3,ec2,iam,apigateway"
ENV DEFAULT_REGION="us-east-1"

# Set LocalStack volume and data directory
VOLUME /var/lib/localstack
WORKDIR /workspace