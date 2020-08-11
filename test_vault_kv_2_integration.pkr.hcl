source "null" "example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.example"
  ]

  provisioner "shell-local"{
      environment_vars = ["MYSECRET=${vault("/secret/data/hello", "missingKey")}"]
      command = "echo MYSECRET is $MYSECRET"
  }
}