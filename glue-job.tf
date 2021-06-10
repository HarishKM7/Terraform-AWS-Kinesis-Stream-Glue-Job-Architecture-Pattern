resource "aws_glue_job" "glue_job" {
  name              = "${var.kinesis_stream_name}-ETL"
  glue_version      = "2.0"
  worker_type       = "G.1X"
  number_of_workers = 2
  timeout           = 60
  role_arn          = aws_iam_role.glue_job.arn
  command {
    python_version  = 3
    script_location = var.glue_etl_script_location
  }
  default_arguments = {
    "--continuous-log-logGroup"          = aws_cloudwatch_log_group.glue_job.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = ""
  }
}

resource "aws_cloudwatch_log_group" "glue_job" {
  name              = "${var.kinesis_stream_name}-ETL"
  retention_in_days = 14
}
