# Intro to Terraform
This repository contains starter code for Session #1 - Intro to Terraform of the Terraform Cohort

## Dependencies
- `terraform ~> 1.5`
- `Google Cloud SDK ~> 434.0.0`

## How to install
#### macOS
``` bash
brew install warrensbox/tap/tfswitch  
```
  
#### Linux (Cloud Shell)
``` bash
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
```

### Download and symlink Terraform binary
``` bash
tfswitch #
```

## How to deploy
```bash

# clone the repo and cd in
git clone https://github.com/noahmercado/terraform-state-management.git

cd terraform-state-management

# OPTIONAL: If cloning locally and using devctonainer, build and start the VS Code devcontainer which includes all the required tooling to depoy
devcontainer build && devcontainer open

# Log in to gcloud cli to authenticate Terraform
gcloud auth login --update-adc

gcloud config set project $YOUR_PROJECT_ID

# Create the GCS bucket for the Terraform backend using the provided script
./scripts/create_tf_backend.sh

# Using the bucket name that was created, modify `backend.tf`
# Using the project ID that you want to deploy into, modify `provider.tf`

# Initialize the Terraform
terraform init

# Validate the Terraform configuration
terraform validate

# Generate a Terraform plan
terraform plan

# Apply the Terraform
terraform apply

# 1. Showcase a statefile hosted in a GCS bucket
# 2. Run terraform show 
# 3. Go through mock "code refactoring" example where we need to rename a Terraform resource
# 4. Go through example of wanting to remove resource from Terraform config but keep the cloud based resource
# 5. Go through example of an outside process modifying a resource that Terraform is managing
# 6. Go through example of importing a resource into state (i.e. app engine application)
```
