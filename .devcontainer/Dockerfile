FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Avoid interactive apt prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && apt-get install -y \
    build-essential \
    flex \
    bison \
    gdb \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

