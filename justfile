infraDir := "infra/us-east-1/"

login env:
    assume-role login -p {{env}}Terraform

plan env dir:
    terragrunt plan --terragrunt-working-dir {{infraDir}}{{env}}/{{dir}}

plan-all env:
    terragrunt run-all plan --terragrunt-working-dir {{infraDir}}{{env}}
    
init env dir:
    terragrunt init --terragrunt-working-dir {{infraDir}}{{env}}/{{dir}}
    
init-all env:
    terragrunt run-all init --terragrunt-working-dir {{infraDir}}{{env}}

fmt:
    terraform fmt --recursive

apply-all env:
    terragrunt run-all apply --terragrunt-working-dir {{infraDir}}{{env}}
    
validate env:
    terragrunt run-all validate --terragrunt-working-dir {{infraDir}}{{env}}

destroy env dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt destroy \
    --terragrunt-working-dir {{infraDir}}/{{env}}/{{dir}}

