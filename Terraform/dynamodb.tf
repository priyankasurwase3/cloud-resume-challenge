resource "aws_dynamodb_table_item" "item" {
  table_name = aws_dynamodb_table.resume_table.name
  hash_key   = aws_dynamodb_table.resume_table.hash_key

  item = <<ITEM
{
  "id": {"N": "1"},
  "count": {"N": "1"}
}
ITEM
}

resource "aws_dynamodb_table" "resume_table" {
  name           = "resume_table"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }
}