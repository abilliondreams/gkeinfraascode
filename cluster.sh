echo 'Deploying K8S on GCP'
terraform init
terraform plan
terraform apply  -auto-approve 

