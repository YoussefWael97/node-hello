# Node Hello World

Simple node.js app that servers "hello world"

Great for testing simple deployments to the cloud

## Run It

`npm start`

```markdown
# CI/CD Pipeline Setup and Usage

This repository contains the code and configuration files necessary to set up and run a CI/CD pipeline for a Node.js web application using GitHub Actions, Docker, and Terraform.

## Prerequisites

Before setting up and running the pipeline, ensure you have the following prerequisites installed:

- Node.js and npm
- Docker
- Terraform
- AWS CLI (deploying to AWS)

## Setup Instructions

1. **Clone the Repository:**

   ```
   git clone https://github.com/YoussefWael97/node-hello.git
   cd node-hello
   ```


2. **Configure Terraform (if deploying to AWS):**

   If deploying to AWS, configure your AWS credentials using the AWS CLI:

   ```
   aws configure
   ```

   Ensure the IAM user has appropriate permissions to create resources like EKS clusters and IAM roles.


3. **Run Locally :**

   You can run the application locally using Docker or directly on your machine using Node.js.

   ```
   docker build -t youssefwael97/hello_repo.
   docker run -p 3000:3000 youssefwael97/hello_repo.
   ```

   Or:

   ```
   npm install
   npm start
   ```

## Usage

1. **Push Changes to GitHub:**

   Push your code changes to the GitHub repository. This will trigger the CI/CD pipeline defined in the GitHub Actions workflow file.

2. **Monitor Pipeline Execution:**

  Monitor and View the pipeline using Github Actions .
  The pipeline will lint the code, build the Docker container, and push it to the container registry.

3. **Deploy Infrastructure (if deploying to AWS):**

   After the container is pushed to the registry, Terraform will deploy the infrastructure to AWS (e.g., EKS cluster). Monitor the Terraform logs for any errors.

4. **Access the Application:**

   After successful deployment, you can access your application through the IP address of deployed application: http://3.80.236.110:3000/.

github repo: node-hello.


