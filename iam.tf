resource "aws_iam_role" "s3_role" {
  name = "test_role"
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
  tags = {
    name = "ec2-s3-access"
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3-access-policy"
  path        = "/"
  description = "My s3 policy to be used by ec2s"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
          "${aws_s3_bucket.devops_s3_course_2022_moved_resource.arn}",
          "${aws_s3_bucket.devops_s3_course_2022_moved_resource.arn}/*",
          "arn:aws:s3:::rady-devops-3",
          "arn:aws:s3:::rady-devops-3/*"
      ]
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
  name = "ec2_profile"
  role = aws_iam_role.s3_role.name
}

