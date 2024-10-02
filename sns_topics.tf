module "operations_engineering_topic" {
  source = "./modules/sns_topic"

  team        = "operations-engineering"
  subscribers = ["lev.gorbunov@digital.justice.gov.uk"]
}