module "s3_full_access_permissions" {
  source                     = "../modules/permissions.tf"
  permission_set_name        = "s3_group_permissions"
  permission_set_description = "Permissions granted to S3 users"
  permission_set_relay_state = "https://console.aws.amazon.com/s3"
  permission_set_session_duration = "PT4H"
  policy_actions = [
    "s3:*",
  ]
  policy_resources = [
    "*",
  ]
}

module "s3_full_access_group" {
  source            = "../modules/groups.tf"
  group_name        = "s3_users"
  group_description = "Group with full S3 access"
  users = [
    {
      display_name = "Ivan"
      user_name    = "ivanc"
      name = object({
        family_name = "C"
        given_name  = "Ivan"
      })
      email = "ivan.c@x.com"
    },
    {
      display_name = "Alan"
      user_name    = "alanb"
      name = object({
        family_name = "B"
        given_name  = "Alan"
      })
      email = "alan.b@x.com"
    }
  ]
}
