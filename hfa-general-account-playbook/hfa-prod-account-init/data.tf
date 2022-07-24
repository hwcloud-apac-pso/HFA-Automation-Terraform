data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../../hfa-core-account-playbook/1.hfa-network-playbook/terraform.tfstate"
  }
}