variable "s3_bucket_name" {
  type        = string
  default     = "rocketseat-bucket-iac-roberto-two"
  description = "Nome do bucket s3"
}

variable "s3_tags" {
  type        = map(string)
  default     = {}
  description = "Tags do bucket s3"
}