data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../1.hfa-network-playbook/terraform.tfstate"
  }
}