output "privateca_certificates_id" {
  description = "Map of id values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no id are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "privateca_certificates_certificate_authority" {
  description = "Map of certificate_authority values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no certificate_authority are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.certificate_authority if v.certificate_authority != null && length(v.certificate_authority) > 0 }
}
output "privateca_certificates_certificate_description" {
  description = "Map of certificate_description values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no certificate_description are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.certificate_description if v.certificate_description != null && length(v.certificate_description) > 0 }
}
output "privateca_certificates_certificate_template" {
  description = "Map of certificate_template values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no certificate_template are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.certificate_template if v.certificate_template != null && length(v.certificate_template) > 0 }
}
output "privateca_certificates_config" {
  description = "Map of config values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no config are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => one(v.config) if v.config != null && length(v.config) > 0 }
}
output "privateca_certificates_create_time" {
  description = "Map of create_time values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no create_time are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "privateca_certificates_deletion_policy" {
  description = "Map of deletion_policy values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no deletion_policy are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "privateca_certificates_effective_labels" {
  description = "Map of effective_labels values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no effective_labels are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "privateca_certificates_issuer_certificate_authority" {
  description = "Map of issuer_certificate_authority values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no issuer_certificate_authority are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.issuer_certificate_authority if v.issuer_certificate_authority != null && length(v.issuer_certificate_authority) > 0 }
}
output "privateca_certificates_labels" {
  description = "Map of labels values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no labels are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "privateca_certificates_lifetime" {
  description = "Map of lifetime values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no lifetime are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.lifetime if v.lifetime != null && length(v.lifetime) > 0 }
}
output "privateca_certificates_location" {
  description = "Map of location values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no location are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.location if v.location != null && length(v.location) > 0 }
}
output "privateca_certificates_name" {
  description = "Map of name values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no name are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "privateca_certificates_pem_certificate" {
  description = "Map of pem_certificate values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no pem_certificate are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.pem_certificate if v.pem_certificate != null && length(v.pem_certificate) > 0 }
}
output "privateca_certificates_pem_certificate_chain" {
  description = "Map of pem_certificate_chain values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no pem_certificate_chain are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.pem_certificate_chain if v.pem_certificate_chain != null && length(v.pem_certificate_chain) > 0 }
}
output "privateca_certificates_pem_csr" {
  description = "Map of pem_csr values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no pem_csr are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.pem_csr if v.pem_csr != null && length(v.pem_csr) > 0 }
}
output "privateca_certificates_pool" {
  description = "Map of pool values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no pool are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.pool if v.pool != null && length(v.pool) > 0 }
}
output "privateca_certificates_project" {
  description = "Map of project values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no project are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.project if v.project != null && length(v.project) > 0 }
}
output "privateca_certificates_revocation_details" {
  description = "Map of revocation_details values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no revocation_details are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.revocation_details if v.revocation_details != null && length(v.revocation_details) > 0 }
}
output "privateca_certificates_terraform_labels" {
  description = "Map of terraform_labels values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no terraform_labels are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "privateca_certificates_update_time" {
  description = "Map of update_time values across all privateca_certificates, keyed the same as var.privateca_certificates except keys with no update_time are omitted"
  value       = { for k, v in google_privateca_certificate.privateca_certificates : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

