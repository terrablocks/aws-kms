# Create a KMS key

![License](https://img.shields.io/github/license/terrablocks/aws-kms?style=for-the-badge) ![Tests](https://img.shields.io/github/workflow/status/terrablocks/aws-kms/tests/main?label=Test&style=for-the-badge) ![Checkov](https://img.shields.io/github/workflow/status/terrablocks/aws-kms/checkov/main?label=Checkov&style=for-the-badge) ![Commit](https://img.shields.io/github/last-commit/terrablocks/aws-kms?style=for-the-badge) ![Release](https://img.shields.io/github/v/release/terrablocks/aws-kms?style=for-the-badge)

This terraform module will setup the following services:
- KMS Key
- KMS Key Alias

# Usage Instructions
## Example
```terraform
module "kms" {
  source = "github.com/terrablocks/aws-kms.git"

  alias = "terrablocks"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.64.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| is_enabled | Whether key is enabled | `bool` | `true` | no |
| description | Description for KMS key | `string` | `"Created by terrablocks"` | no |
| key_usage | The intended use of the key. **Valid values:** `ENCRYPT_DECRYPT` or `SIGN_VERIFY` | `string` | `"ENCRYPT_DECRYPT"` | no |
| cmk_spec | Whether the key is a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. **Valid values:** `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1` | `string` | `"SYMMETRIC_DEFAULT"` | no |
| policy | IAM policy in JSON format to associate to the key | `string` | `""` | no |
| deletion_window | Number of days after which key should be deleted. Minimum is 7 and maximum is 30 days, both inclusive | `number` | `7` | no |
| enable_key_rotation | Whether to automatically rotate key periodically | `bool` | `true` | no |
| multi_region | Whether to create a multi-region key | `bool` | `false` | no |
| alias | Alias for KMS key | `string` | n/a | yes |
| tags | Map of key-value pair to associate with resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| key_arn | ARN of KMS key |
| key_id | ID of KMS key |
| key_alias_arn | ARN of KMS key alias |
