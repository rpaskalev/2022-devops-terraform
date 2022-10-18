resource "aws_iam_user" "test" {
    count = var.environment == "prod" && var.create_users == "true" ? length(var.user_names) :  0
  #             if ^      equals ^  then do ^            else do ^
    name = var.user_names[count.index]

    # count = var.create_users ? 3 : 0
   #       if this var ^ is true then create 1, else create 0 
}


