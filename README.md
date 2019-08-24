# Test of Zubin Ghafari's AWS GuardDuty Multi-Account Terraform Modules

This is some code to test @zghafari's [guardduty](https://github.com/zghafari/guardduty) Terraform module.

# Usage

## Init

```text
▶ terraform init
Initializing modules...
Downloading github.com/zghafari/guardduty/mastermodule for guardduty-master-module...
- guardduty-master-module in .terraform/modules/guardduty-master-module/mastermodule
Downloading github.com/zghafari/guardduty/membermodule for guardduty-member-module...
- guardduty-member-module in .terraform/modules/guardduty-member-module/membermodule
```

## Apply

This failed:

```text
▶ TF_VAR_ACCOUNT=xxxxxxxxxxxx terraform apply -auto-approve
...
▶ terraform apply -auto-approve
module.guardduty-master-module.aws_guardduty_detector.master: Creating...
module.guardduty-master-module.aws_guardduty_detector.master: Creation complete after 1s [id=5cb661e70fd7182c5507a21928418e82]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Creating...
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [10s elapsed]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [20s elapsed]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [30s elapsed]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [40s elapsed]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [50s elapsed]
module.guardduty-master-module.aws_guardduty_member.prod_member[0]: Still creating... [1m0s elapsed]

Error: error waiting for GuardDuty Member "5cb661e70fd7182c5507a21928418e82:885164491973" invite: Error waiting for GuardDuty email verification: error reading GuardDuty Member "xxxxxxxxxxxx": member missing from response

  on .terraform/modules/guardduty-master-module/mastermodule/main.tf line 5, in resource "aws_guardduty_member" "prod_member":
   5: resource "aws_guardduty_member" "prod_member" {
```

Unsure how to verify the email.
