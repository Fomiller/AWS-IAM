include "root" {
	path = find_in_parent_folders()
}

dependencies = ["../../iam/"]

dependency "member_route53" {
    config_path = "../member"
    mock_outputs_merge_strategy_with_state = "shallow"
    mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply", "destroy"]
    mock_outputs = {
        fomillercloud_subdomain_public_zone_id = "MOCK123456789"
        fomillercloud_name_servers = [
            "ns-123.awsdns-04.net.",
            "ns-1234.awsdns-10.org.",
            "ns-1243.awsdns-29.co.uk.",
            "ns-69.awsdns-05.com."
        ]
    }
}

inputs = {
    fomillercloud_subdomain_public_zone_id = dependency.member_route53.outputs.fomillercloud_subdomain_public_zone_id
    fomillercloud_name_servers = dependency.member_route53.outputs.fomillercloud_name_servers
}
