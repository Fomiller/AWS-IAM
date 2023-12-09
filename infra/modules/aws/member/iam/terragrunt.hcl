include "root" {
  path = find_in_parent_folders()
}

dependency "member_route53" {
    config_path = "../route53/member"
    mock_outputs_merge_strategy_with_state = "shallow"
    mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply", "destroy"]
    mock_outputs = {
        fomillercloud_subdomain_public_arn = "arn:aws:route53:::hostedzone/MOCK-12341234"
    }
}

inputs = {
    fomillercloud_subdomain_public_arn = dependency.member_route53.outputs.fomillercloud_subdomain_public_arn
}
