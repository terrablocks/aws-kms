output "key_arn" {
  value       = aws_kms_key.this.arn
  description = "ARN of KMS key"
}

output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "ID of KMS key"
}

output "key_alias_arn" {
  value       = aws_kms_alias.this.arn
  description = "ARN of KMS key alias"
}
