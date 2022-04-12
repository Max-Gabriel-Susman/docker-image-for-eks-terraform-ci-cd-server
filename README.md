# Docker Image for Provisioning of a Jenkins CI/CD Server for Terraform EKS configuration on an EC2 instance

This repository contains the tools for provisioning an EC2 instance on a target AWS account and then spinning up a containerized instance of Jenkins for the purposes of hosting a CI/CD Pipeline for the Terraform Configuration of an EKS cluster. Eventually this will be containerized but for now the provisioning is manually executed from the Makefile(for supported operating systems). 

Current Supported Operating Systems and Their Provisioning process:

1. MacOS:
    1. make provision_on_macos