module "operations_engineering_topic" {
  source = "./modules/sns_topic"

  team        = "operations-engineering"
  subscribers = ["lev.gorbunov@digital.justice.gov.uk"]
}

module "modernisation_platform_topic" {
  source = "./modules/sns_topic"

  team        = "modernisation-platform"
  subscribers = ["modernisation-platform@digital.justice.gov.uk"]
}