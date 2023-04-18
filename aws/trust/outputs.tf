output "openid_claims" {
  description = "OpenID Claims for trust relationship"
  value       = vault_jwt_auth_backend_role.tfc_role.bound_claims
}

output "tfc_workspace_name" {
  description = "Name of configured workspace"
  value       = tfe_workspace.trust_workspace.name
}

output "tfc_workspace_url" {
  description = "URL of configured workspace"
  value       = tfe_workspace.trust_workspace.html_url
}
