auto_auth {
  method "approle" {
    config = {
      role_id_file_path   = "/etc/vault/bootstrap/roleid"
      secret_id_file_path = "/etc/vault/bootstrap/wrap_secretid"
      secret_id_response_wrapping_path = "auth/approle/role/__APPROLE_NAME__/secret-id"
      remove_secret_id_file_after_reading = false
      #secret_id_file_path = "/etc/vault/secretid"
      #secret_id_response_wrapping_token_file_path = "/etc/vault/wrap_secretid"
      #remove_secret_id_file_after_reading = false
    }
  }
}

template {
  source      = "/etc/vault/templates/config.ctmpl"
  destination = "/secrets/application-secrets.properties"
}

