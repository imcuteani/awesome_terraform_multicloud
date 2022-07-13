# Create a simple SNS topic 

resource "aws_sns_topic" "example" {
  name = var.aws_sns_topic_name
}