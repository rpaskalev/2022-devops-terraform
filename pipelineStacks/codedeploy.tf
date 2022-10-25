
resource "aws_iam_role" "deploy_role" {
  name = "deploy-role-devops-2022"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "deploy-policy-devops-2022"
  role = aws_iam_role.deploy_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

####################################
# code deploy resource 
####################################

resource "aws_codedeploy_app" "example" {
  compute_platform = "Server"
  name             = "MyDemoApplication"
}

resource "aws_codedeploy_deployment_group" "example" {
  app_name              = aws_codedeploy_app.example.name
  deployment_group_name = "MyDeploymentGroup"
  service_role_arn      = aws_iam_role.deploy_role.arn

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "SampleApp"
  }
}

 