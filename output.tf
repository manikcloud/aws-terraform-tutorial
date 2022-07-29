output "file_content" {
  value       = local_file.file_config.content
  description = "config file content"
}
output "code_commit_repo" {
  value       = aws_codecommit_repository.test.repository_name
  description = "Code Commit Repo Name"
}
output "iam_user" {
  value       = aws_iam_user.user.name
  description = "IAM user name"
}

output "iam_ssh_key" {
  value       = aws_iam_user_ssh_key.user.id
  description = "ssh key id"

}
