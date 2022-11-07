output "vm_azure_ip" {
  value = azurerm_linux_virtual_machine.vm-azure.public_ip_address

}

output "vm_aws_ip" {
    value = aws_instance.vm-aws.public_ip
  
}