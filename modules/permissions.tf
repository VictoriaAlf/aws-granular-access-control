variable "permission_set_name" {
  type        = string
  description = "Name of the permission set"
}

variable "permission_set_description" {
  type        = string
  description = "Description of the permission set"
}

variable "permission_set_relay_state" {
  type        = string
  description = "URL to redirect user after login"
}

variable "permission_set_session_duration" {
  type        = string
  description = "Duration of the session"
}

variable "policy_actions" {
  type        = list(string)
  description = "List of actions allowed by the policy"
  default     = []
}

variable "policy_resources" {
  type        = list(string)
  description = "List of resources allowed by the policy"
  default     = []
}

data "aws_ssoadmin_instances" "this" {}

resource "aws_ssoadmin_permission_set" "this" {
  name             = var.permission_set_name
  description      = var.permission_set_description
  relay_state      = var.permission_set_relay_state
  session_duration = var.permission_set_session_duration
  instance_arn     = tolist(data.aws_ssoadmin_instances.this.arns)[0]
}

data "aws_iam_policy_document" "this" {
  statement {
    sid       = "Permissions"
    actions   = var.policy_actions
    resources = var.policy_resources
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  inline_policy      = data.aws_iam_policy_document.this.json
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  instance_arn       = tolist(data.aws_ssoadmin_instances.this.arns)[0]
}
