variable "ACCOUNT" {}

module "guardduty-master-module" {
  source = "github.com/zghafari/guardduty/mastermodule"

  member_account_emails  = ["alexharv074@gmail.com"]
  member_account_ids     = [var.account]
}
