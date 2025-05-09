locals {
  tags = merge(var.tags, {
    stack_name = "azure-full-bootstrap"
  })
}
