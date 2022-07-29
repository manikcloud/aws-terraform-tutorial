

resource "aws_codecommit_repository" "test" {
  repository_name = "MyTestRepository"
  description     = "This is the Sample App Repository"
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "iam_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAu+YS/tWeq5sNI5NtlIxH5J5d1ijZ98YyiE4WFeT6HQqAUfRsid0ANgMVwzJlY18wQDAeUdGPE3W4ijblaeKJfU04y2ycBUzm4GEEx/GlhPpQQsSfe7cZ4EDR7HTeqYAPwyJfmZEc7Md5zjzF/bQFMbau5mEexvWkn3ZmqoHu9tN2FIGWtudRRygiN+L2yybuhHj31n2IGo6XHowoibd8wGq0l/SSHp5PRz2Xyuy1PMeR+LmtGvmDiC4oCV626eEozF2jGbHfz6Pbw3dmAsbCiDSFHmXMfzMgxpy/pvZ2SAvU05JmQxO1abv5ukrnZFYa0Fmz7XDWQ3hF2NbCOCS3 root@ip-172-31-93-193.ec2.internal"
}

resource "aws_iam_user" "user" {
  name = "test-user"
  path = "/"
}


resource "aws_iam_user_policy" "usr_ro" {
  name = "admin-role"
  user = aws_iam_user.user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_user_ssh_key" "user" {
  username   = aws_iam_user.user.name
  encoding   = "SSH"
  public_key = aws_key_pair.ssh_key.public_key
}



output "iam_ssh_key" {
  value       = aws_iam_user_ssh_key.user.id
  description = "ssh key id"

}
