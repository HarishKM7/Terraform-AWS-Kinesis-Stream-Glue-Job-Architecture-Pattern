resource "aws_iam_role" "glue_job" {
  name               = "${var.kinesis_stream_name}-ETL"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.glue_assume_role_policy.json
  managed_policy_arns = [
    module.kinesis_stream.kinesis_stream_iam_policy_read_only_arn,
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]
}

data "aws_iam_policy_document" "glue_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}
