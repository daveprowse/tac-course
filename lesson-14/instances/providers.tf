provider "aws" {
   region     = "us-east-2"
}

provider "aws" {
   alias = "virginia"
   region     = "us-east-1"
}

provider "azurerm" {
  features {}
}
