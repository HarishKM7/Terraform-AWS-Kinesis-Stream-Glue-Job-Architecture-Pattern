variable "kinesis_stream_name" {}

variable "glue_etl_script_location" {
  description = "S3 location of the Python 3 ETL script to be used for the Glue job. EG: s3://my-bucket/my-script.py"
}
