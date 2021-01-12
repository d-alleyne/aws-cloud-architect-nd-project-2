# TODO: Define the output variable for the lambda function.
output "exerise2_function_name" {
    description = "Name of the Lambda function"
    value = module.lambda_function.this_lambda_function_name
}
output "exercise2_cloudwatch_log_group_arn" {
    description = "The ARN of the Cloudwatch Log Group"
    value = module.lambda_function.lambda_cloudwatch_log_group_arn
}
output "exercise2_iam_role_arn" {
    description = "The ARN of the IAM role created for the Lambda Function"
    value = module.lambda_function.lambda_role_arn
}
output "exercise2_function_arn" {
    description = "The ARN of the Lambda Function"
    value = module.lambda_function.this_lambda_function_arn
}
output "exercise2_function_invoke_arn" {
    description = "The Invoke ARN of the Lambda Function"
    value = module.lambda_function.this_lambda_function_invoke_arn
}
