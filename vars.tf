variable "is_enabled" {
  type        = bool
  default     = true
  description = "Whether key is enabled"
}

variable "description" {
  type        = string
  default     = "Created by terrablocks"
  description = "Description for KMS key"
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "The intended use of the key. **Valid values:** `ENCRYPT_DECRYPT` or `SIGN_VERIFY`"
}

variable "cmk_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Whether the key is a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. **Valid values:** `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`"
}

variable "policy" {
  type        = string
  default     = ""
  description = "IAM policy in JSON format to associate to the key"
}

variable "deletion_window" {
  type        = number
  default     = 7
  description = "Number of days after which key should be deleted. Minimum is 7 and maximum is 30 days, both inclusive"
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Whether to automatically rotate key periodically"
}

variable "multi_region" {
  type        = bool
  default     = false
  description = "Whether to create a multi-region key"
}

variable "alias" {
  type        = string
  description = "Alias for KMS key"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of key-value pair to associate with resources"
}
