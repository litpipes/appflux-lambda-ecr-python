################################################
# [LitPipes] ECR Variables
# This variables could be used when the repository use ECR as container repository
# If this repository use the ECR as container repository then these variables will be automatically completed
################################################

variable "ecr_image_tag" {
 type = string
}

variable "ecr_image_repository" {
 type = string
}

################################################
# [LitPipes] Lambda Variables
# This variables could be used when the repository use Lambda as container repository
################################################

variable "lambda_function_name" {
 type = string
# default = ""
}


################################################
# Your Variables
# Declare your variables below
################################################

