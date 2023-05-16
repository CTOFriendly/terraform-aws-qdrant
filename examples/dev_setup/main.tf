
module "qdrant" {
    source = "../.."
    region = "us-east-1"
    instance_type = "c6g.medium"
}

output "qdrant_ip" {
  value =  module.qdrant.qdrant_ip
}