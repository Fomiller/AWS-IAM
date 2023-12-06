set export 

infraDir := "infra/modules/aws"

login env:
    assume-role login -p {{env}}Terraform

init dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt init \
    --terragrunt-working-dir {{infraDir}}/{{dir}}
    
init-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all init \
    --terragrunt-working-dir {{infraDir}}

validate dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt validate \
    --terragrunt-working-dir {{infraDir}}/{{dir}}

validate-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt validate \
    --terragrunt-working-dir {{infraDir}}
    
plan dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt plan \
    --terragrunt-working-dir {{infraDir}}/{{dir}}

plan-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all \
    plan --terragrunt-working-dir {{infraDir}}
    
apply dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt apply \
    -auto-approve \
    --terragrunt-working-dir {{infraDir}}/{{dir}} \
    
apply-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all apply \
    --terragrunt-working-dir={{infraDir}} \
    --terragrunt-non-interactive

destroy dir:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt destroy \
    --terragrunt-working-dir {{infraDir}}/{{dir}} \
    --terragrunt-non-interactive
    
destroy-all:
    doppler run \
    --name-transformer tf-var  \
    -- terragrunt run-all \
    destroy --terragrunt-working-dir {{infraDir}}
    

fmt:
    doppler run \
    --name-transformer tf-var  \
    -- terraform fmt \
    --recursive

@init-org-module dir acct="org":
    mkdir -p {{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1
    
    touch {{infraDir}}/{{acct}}/{{dir}}/env-config/common.tfvars
    touch {{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/common.tfvars
    touch {{infraDir}}/{{acct}}/{{dir}}/_outputs.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_inputs.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_data.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_variables.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/{{dir}}.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/main.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/terragrunt.hcl
    
    echo 'asset_name = "{{dir}}"' >> {{infraDir}}/{{acct}}/{{dir}}/env-config/common.tfvars
    echo 'locals {}' >> {{infraDir}}/{{acct}}/{{dir}}/main.tf
    
    touch "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/org.tfvars" 
    echo 'environment = "org"' > "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/org.tfvars";
    
    echo 'include "root" {\n\
    \tpath = find_in_parent_folders()\n\
    }' > {{infraDir}}/{{acct}}/{{dir}}/terragrunt.hcl
    @# {{infraDir}}/{{dir}} created.

@init-member-module dir acct="member":
    mkdir -p {{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1
    
    touch {{infraDir}}/{{acct}}/{{dir}}/env-config/common.tfvars
    touch {{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/common.tfvars
    touch {{infraDir}}/{{acct}}/{{dir}}/_outputs.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_inputs.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_data.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/_variables.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/{{dir}}.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/main.tf
    touch {{infraDir}}/{{acct}}/{{dir}}/terragrunt.hcl
    
    echo 'asset_name = "{{dir}}"' >> {{infraDir}}/{{acct}}/{{dir}}/env-config/common.tfvars
    echo 'locals {}' >> {{infraDir}}/{{acct}}/{{dir}}/main.tf
    
    touch "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/prod.tfvars"
    touch "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/dev.tfvars" 
    echo 'environment = "dev"' > "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/dev.tfvars"
    echo 'environment = "prod"' > "{{infraDir}}/{{acct}}/{{dir}}/env-config/us-east-1/prod.tfvars";

    echo 'include "root" {\n\
    \tpath = find_in_parent_folders()\n\
    }' > {{infraDir}}/{{acct}}/{{dir}}/terragrunt.hcl
    @# {{infraDir}}/{{dir}} created.
