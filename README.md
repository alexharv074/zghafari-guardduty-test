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
module.guardduty-member-module.aws_guardduty_detector.member: Creating...
module.guardduty-master-module.aws_guardduty_detector.master: Creating...
module.guardduty-member-module.aws_guardduty_detector.member: Creation complete after 2s [id=d2b661ddfd8947c067ffbf9d6f591b2a]

Error: Creating GuardDuty Detector failed: BadRequestException: The request is rejected because a detector already exists for the current account.
        status code: 400, request id: f28199c5-c66f-11e9-9cd8-23b8435742c1

  on .terraform/modules/guardduty-master-module/mastermodule/main.tf line 1, in resource "aws_guardduty_detector" "master":
   1: resource "aws_guardduty_detector" "master" {
```

Seems my account already has a detector in it.
