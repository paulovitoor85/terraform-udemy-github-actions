variable "aws_pub_key" {
    description = "Chave publica AWS"
    type = string
    
}

variable "azure_pub_key" {
    description = "Chave publica AZURE"
    type = string
    
}
variable "location" {
    description = "região dos recursos"
    type = string
    default = "East US"

}

variable "account_tier" {
    description = "tier da SA"
    type = string
    default = "Standard"
}

variable "account_replication_type" {
    description = "tipo da replicação"
    type = string
    default = "LRS"
}

