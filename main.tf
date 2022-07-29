

resource "aws_codecommit_repository" "test" {
  repository_name = "MyTestRepository"
  description     = "This is the Sample App Repository"
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "iam_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF8yQCsdv/nNB0PBA1qCbp8SDws1Y8a7nHPikhJtqwbg0sL9GVjPO2zMEnWQRzcMD8kuvTbJf4GfaC1wKbALXUMeAR6Z8RGVzLXH3zJgiXdlYnM/VcFqEe82RBAZFV9l2S1BbpdrhsvbhusZ5QfnWoS0kmUeHXgU8HPlYmEU5i+YjXQ4T2kEiMLwuUbfTMZDWL6XHrGwG8zRtRFM9DzV1Lq+Sa2qurey6U9XsCT0qF18YyAlFAvpTBKMmQXquZI/QcBZPGllwWhBIiVHRKeA0HtYY9vCzsKvimnccQ5c23nmFXwQK/Odabwd1eTT4Pa9tdoBIu4pGhvMWGv/Aua4JZ root@ip-172-31-93-193.ec2.internal"
}

resource "aws_iam_user" "user" {
  name = "code_commit_user"
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

