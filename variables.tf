variable "privateca_certificates" {
  description = <<EOT
Map of privateca_certificates, attributes below
Required:
    - location
    - name
    - pool
Optional:
    - certificate_authority
    - certificate_template
    - deletion_policy
    - labels
    - lifetime
    - pem_csr
    - project
    - config (block):
        - public_key (required, block):
            - format (required)
            - key (optional)
        - subject_config (required, block):
            - subject (required, block):
                - common_name (required)
                - country_code (optional)
                - locality (optional)
                - organization (optional)
                - organizational_unit (optional)
                - postal_code (optional)
                - province (optional)
                - street_address (optional)
            - subject_alt_name (optional, block):
                - dns_names (optional)
                - email_addresses (optional)
                - ip_addresses (optional)
                - uris (optional)
        - subject_key_id (optional, block):
            - key_id (optional)
        - x509_config (required, block):
            - additional_extensions (optional, block):
                - critical (required)
                - object_id (required, block):
                    - object_id_path (required)
                - value (required)
            - aia_ocsp_servers (optional)
            - ca_options (optional, block):
                - is_ca (optional)
                - max_issuer_path_length (optional)
                - non_ca (optional)
                - zero_max_issuer_path_length (optional)
            - key_usage (required, block):
                - base_key_usage (required, block):
                    - cert_sign (optional)
                    - content_commitment (optional)
                    - crl_sign (optional)
                    - data_encipherment (optional)
                    - decipher_only (optional)
                    - digital_signature (optional)
                    - encipher_only (optional)
                    - key_agreement (optional)
                    - key_encipherment (optional)
                - extended_key_usage (required, block):
                    - client_auth (optional)
                    - code_signing (optional)
                    - email_protection (optional)
                    - ocsp_signing (optional)
                    - server_auth (optional)
                    - time_stamping (optional)
                - unknown_extended_key_usages (optional, block):
                    - object_id_path (required)
            - name_constraints (optional, block):
                - critical (required)
                - excluded_dns_names (optional)
                - excluded_email_addresses (optional)
                - excluded_ip_ranges (optional)
                - excluded_uris (optional)
                - permitted_dns_names (optional)
                - permitted_email_addresses (optional)
                - permitted_ip_ranges (optional)
                - permitted_uris (optional)
            - policy_ids (optional, block):
                - object_id_path (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location              = string
    name                  = string
    pool                  = string
    certificate_authority = optional(string)
    certificate_template  = optional(string)
    deletion_policy       = optional(string)
    labels                = optional(map(string))
    lifetime              = optional(string)
    pem_csr               = optional(string)
    project               = optional(string)
    config = optional(object({
      public_key = object({
        format = string
        key    = optional(string)
      })
      subject_config = object({
        subject = object({
          common_name         = string
          country_code        = optional(string)
          locality            = optional(string)
          organization        = optional(string)
          organizational_unit = optional(string)
          postal_code         = optional(string)
          province            = optional(string)
          street_address      = optional(string)
        })
        subject_alt_name = optional(object({
          dns_names       = optional(list(string))
          email_addresses = optional(list(string))
          ip_addresses    = optional(list(string))
          uris            = optional(list(string))
        }))
      })
      subject_key_id = optional(object({
        key_id = optional(string)
      }))
      x509_config = object({
        additional_extensions = optional(list(object({
          critical = bool
          object_id = object({
            object_id_path = list(number)
          })
          value = string
        })))
        aia_ocsp_servers = optional(list(string))
        ca_options = optional(object({
          is_ca                       = optional(bool)
          max_issuer_path_length      = optional(number)
          non_ca                      = optional(bool)
          zero_max_issuer_path_length = optional(bool)
        }))
        key_usage = object({
          base_key_usage = object({
            cert_sign          = optional(bool)
            content_commitment = optional(bool)
            crl_sign           = optional(bool)
            data_encipherment  = optional(bool)
            decipher_only      = optional(bool)
            digital_signature  = optional(bool)
            encipher_only      = optional(bool)
            key_agreement      = optional(bool)
            key_encipherment   = optional(bool)
          })
          extended_key_usage = object({
            client_auth      = optional(bool)
            code_signing     = optional(bool)
            email_protection = optional(bool)
            ocsp_signing     = optional(bool)
            server_auth      = optional(bool)
            time_stamping    = optional(bool)
          })
          unknown_extended_key_usages = optional(list(object({
            object_id_path = list(number)
          })))
        })
        name_constraints = optional(object({
          critical                  = bool
          excluded_dns_names        = optional(list(string))
          excluded_email_addresses  = optional(list(string))
          excluded_ip_ranges        = optional(list(string))
          excluded_uris             = optional(list(string))
          permitted_dns_names       = optional(list(string))
          permitted_email_addresses = optional(list(string))
          permitted_ip_ranges       = optional(list(string))
          permitted_uris            = optional(list(string))
        }))
        policy_ids = optional(list(object({
          object_id_path = list(number)
        })))
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

