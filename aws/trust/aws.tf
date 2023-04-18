# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.aws_region
}

# data "aws_caller_identity" "current" {}

resource "aws_iam_user" "secrets_engine" {
  name = "hcp-vault-secrets-engine"
}

resource "aws_iam_access_key" "secrets_engine_credentials" {
  # WARNING - The credentials this resource generateds will be written in plaintext in the statefiles for this configuration.
  # Protect the statefiles for this configuration accordingly!
  user = aws_iam_user.secrets_engine.name
}

resource "aws_iam_user_policy" "vault_secrets_engine_generate_credentials" {
  name = "hcp-vault-secrets-engine-policy"
  user = aws_iam_user.secrets_engine.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = "${aws_iam_role.tfc_role.arn}"
      },
    ]
  })
}

resource "aws_iam_role" "tfc_role" {
  name = "tfc-role"

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action    = "sts:AssumeRole"
          Condition = {}
          Effect    = "Allow"
          Principal = {
            AWS = aws_iam_user.secrets_engine.arn
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
}

resource "aws_iam_policy" "tfc_policy" {
  name        = "tfc-policy"
  description = "TFC run policy"

  policy = jsonencode({
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "tfc_policy_attachment" {
  role       = aws_iam_role.tfc_role.name
  policy_arn = aws_iam_policy.tfc_policy.arn
}

