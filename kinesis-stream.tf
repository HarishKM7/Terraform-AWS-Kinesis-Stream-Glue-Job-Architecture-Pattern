module "kinesis_stream" {
  source           = "rodrigodelmonte/kinesis-stream/aws"
  version          = ">= 2.0.3"
  name             = var.kinesis_stream_name
  shard_count      = 1
  retention_period = 24
  encryption_type  = "KMS"
  kms_key_id       = "alias/aws/kinesis"
  tags             = { Name = var.kinesis_stream_name }
  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
    "IncomingRecords",
    "OutgoingRecords",
    "IteratorAgeMilliseconds",
    "ReadProvisionedThroughputExceeded",
    "WriteProvisionedThroughputExceeded"
  ]
}
