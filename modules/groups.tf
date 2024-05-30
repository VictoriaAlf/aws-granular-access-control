variable "group_name" {
  type        = string
  description = "Name of the group"
}

variable "group_description" {
  type        = string
  description = "Description of the group"
}

variable "users" {
  type = list(object({
    display_name = string
    user_name    = string
    name = object({
      family_name = string
      given_name  = string
    })
    email = string
  }))
}

data "aws_ssoadmin_instances" "this" {}

resource "aws_identitystore_group" "this" {
  display_name    = var.group_name
  description     = var.group_description
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

resource "aws_identitystore_group_membership" "this" {
  for_each = { for user in var.users : user.user_name => user }
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  group_id          = aws_identitystore_group.this.group_id
  member_id         = each.value.user_name
}
