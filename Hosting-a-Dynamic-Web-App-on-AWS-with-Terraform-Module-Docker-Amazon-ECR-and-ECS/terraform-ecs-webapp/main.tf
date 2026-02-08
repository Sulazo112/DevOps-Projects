module "ecr" {
  source          = "./modules/ecr"
  repository_name = "ecs-webapp-repo"
}

module "ecs" {
  source    = "./modules/ecs"
  app_name  = "ecs-webapp"
  image_url = module.ecr.repository_url
  region    = var.region
}

