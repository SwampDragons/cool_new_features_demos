locals {
    VAULT_SECRET = vault("kv1/my-secret", "my-value")
}

source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]
  provisioner "shell-local"{
      environment_vars = ["MYSECRET=${local.VAULT_SECRET}"]
      command = "echo MYSECRET is $MYSECRET"
  }
  provisioner "shell-local"{
      environment_vars = ["MYSECRET=${vault("kv1/my-secret", "my-value")}"]
      command = "echo MYSECRET is $MYSECRET"
  }
}