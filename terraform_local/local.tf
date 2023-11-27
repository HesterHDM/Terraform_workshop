resource "local_file" "readonly_file" {
	filename = "/home/sanjuadmin/Terraform/terraform_local/readonly.txt"
	file_permission = "400"
	content = "I will become a Devops engineer"
}
