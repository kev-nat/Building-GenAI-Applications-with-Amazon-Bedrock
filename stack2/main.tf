provider "aws" {
  region = "us-west-2"  
}

module "bedrock_kb" {
  source = "../modules/bedrock_kb" 

  knowledge_base_name        = "my-bedrock-kb"
  knowledge_base_description = "Knowledge base connected to Aurora Serverless database"

  aurora_arn          = "arn:aws:rds:us-west-2:317395562947:cluster:my-aurora-serverless" # Copied from stack1 output
  aurora_db_name      = "myapp"
  aurora_endpoint     = "my-aurora-serverless.cluster-ccvfkywfy409.us-west-2.rds.amazonaws.com" # Copied from stack1 output
  aurora_table_name   = "bedrock_integration.bedrock_kb"
  aurora_primary_key_field = "id"
  aurora_metadata_field = "metadata"
  aurora_text_field   = "chunks"
  aurora_verctor_field = "embedding"
  aurora_username     = "dbadmin"
  aurora_secret_arn   = "arn:aws:secretsmanager:us-west-2:317395562947:secret:my-aurora-serverless-8FRnXY" # Copied from stack1 output
  s3_bucket_arn       = "arn:aws:s3:::bedrock-kb-317395562947" # Copied from stack1 output
}