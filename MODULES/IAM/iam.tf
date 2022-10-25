resource "aws_iam_role" "s3_role" {
  name = "${var.environment}-test-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_policy" {
  name        = "${var.environment}-test-policy"
  path        = "/"
  description = "My s3 policy to be used by ec2s"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket",
                "s3:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "${var.environment}-ec2-profile"
  role = aws_iam_role.s3_role.name
}

