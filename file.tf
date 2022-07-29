resource "local_file" "file_config" {
  depends_on      = [aws_iam_user_ssh_key.user]
  content         = <<EOT
 	Host git-codecommit.*.amazonaws.com
	User ${aws_iam_user_ssh_key.user.id}
	IdentityFile ~/.ssh/id_rsa
	EOT  
  filename        = "/root/.ssh/config"
  file_permission = 0600
}
