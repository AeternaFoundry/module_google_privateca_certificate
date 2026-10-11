resource "google_privateca_certificate" "privateca_certificates" {
  for_each = var.privateca_certificates

  location              = each.value.location
  name                  = each.value.name
  pool                  = each.value.pool
  certificate_authority = each.value.certificate_authority
  certificate_template  = each.value.certificate_template
  deletion_policy       = each.value.deletion_policy
  labels                = each.value.labels
  lifetime              = each.value.lifetime
  pem_csr               = each.value.pem_csr
  project               = each.value.project

  dynamic "config" {
    for_each = each.value.config != null ? [each.value.config] : []
    content {
      public_key {
        format = config.value.public_key.format
        key    = config.value.public_key.key
      }
      subject_config {
        subject {
          common_name         = config.value.subject_config.subject.common_name
          country_code        = config.value.subject_config.subject.country_code
          locality            = config.value.subject_config.subject.locality
          organization        = config.value.subject_config.subject.organization
          organizational_unit = config.value.subject_config.subject.organizational_unit
          postal_code         = config.value.subject_config.subject.postal_code
          province            = config.value.subject_config.subject.province
          street_address      = config.value.subject_config.subject.street_address
        }
        dynamic "subject_alt_name" {
          for_each = config.value.subject_config.subject_alt_name != null ? [config.value.subject_config.subject_alt_name] : []
          content {
            dns_names       = subject_alt_name.value.dns_names
            email_addresses = subject_alt_name.value.email_addresses
            ip_addresses    = subject_alt_name.value.ip_addresses
            uris            = subject_alt_name.value.uris
          }
        }
      }
      dynamic "subject_key_id" {
        for_each = config.value.subject_key_id != null ? [config.value.subject_key_id] : []
        content {
          key_id = subject_key_id.value.key_id
        }
      }
      x509_config {
        dynamic "additional_extensions" {
          for_each = config.value.x509_config.additional_extensions != null ? config.value.x509_config.additional_extensions : []
          content {
            critical = additional_extensions.value.critical
            object_id {
              object_id_path = additional_extensions.value.object_id.object_id_path
            }
            value = additional_extensions.value.value
          }
        }
        aia_ocsp_servers = config.value.x509_config.aia_ocsp_servers
        dynamic "ca_options" {
          for_each = config.value.x509_config.ca_options != null ? [config.value.x509_config.ca_options] : []
          content {
            is_ca                       = ca_options.value.is_ca
            max_issuer_path_length      = ca_options.value.max_issuer_path_length
            non_ca                      = ca_options.value.non_ca
            zero_max_issuer_path_length = ca_options.value.zero_max_issuer_path_length
          }
        }
        key_usage {
          base_key_usage {
            cert_sign          = config.value.x509_config.key_usage.base_key_usage.cert_sign
            content_commitment = config.value.x509_config.key_usage.base_key_usage.content_commitment
            crl_sign           = config.value.x509_config.key_usage.base_key_usage.crl_sign
            data_encipherment  = config.value.x509_config.key_usage.base_key_usage.data_encipherment
            decipher_only      = config.value.x509_config.key_usage.base_key_usage.decipher_only
            digital_signature  = config.value.x509_config.key_usage.base_key_usage.digital_signature
            encipher_only      = config.value.x509_config.key_usage.base_key_usage.encipher_only
            key_agreement      = config.value.x509_config.key_usage.base_key_usage.key_agreement
            key_encipherment   = config.value.x509_config.key_usage.base_key_usage.key_encipherment
          }
          extended_key_usage {
            client_auth      = config.value.x509_config.key_usage.extended_key_usage.client_auth
            code_signing     = config.value.x509_config.key_usage.extended_key_usage.code_signing
            email_protection = config.value.x509_config.key_usage.extended_key_usage.email_protection
            ocsp_signing     = config.value.x509_config.key_usage.extended_key_usage.ocsp_signing
            server_auth      = config.value.x509_config.key_usage.extended_key_usage.server_auth
            time_stamping    = config.value.x509_config.key_usage.extended_key_usage.time_stamping
          }
          dynamic "unknown_extended_key_usages" {
            for_each = config.value.x509_config.key_usage.unknown_extended_key_usages != null ? config.value.x509_config.key_usage.unknown_extended_key_usages : []
            content {
              object_id_path = unknown_extended_key_usages.value.object_id_path
            }
          }
        }
        dynamic "name_constraints" {
          for_each = config.value.x509_config.name_constraints != null ? [config.value.x509_config.name_constraints] : []
          content {
            critical                  = name_constraints.value.critical
            excluded_dns_names        = name_constraints.value.excluded_dns_names
            excluded_email_addresses  = name_constraints.value.excluded_email_addresses
            excluded_ip_ranges        = name_constraints.value.excluded_ip_ranges
            excluded_uris             = name_constraints.value.excluded_uris
            permitted_dns_names       = name_constraints.value.permitted_dns_names
            permitted_email_addresses = name_constraints.value.permitted_email_addresses
            permitted_ip_ranges       = name_constraints.value.permitted_ip_ranges
            permitted_uris            = name_constraints.value.permitted_uris
          }
        }
        dynamic "policy_ids" {
          for_each = config.value.x509_config.policy_ids != null ? config.value.x509_config.policy_ids : []
          content {
            object_id_path = policy_ids.value.object_id_path
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

