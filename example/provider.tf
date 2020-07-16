# _provider.tf
provider "aws" {
  region = "eu-central-1" 
}

provider "aws" {
  alias  = "eu-north-1"
  region = "eu-north-1"
}