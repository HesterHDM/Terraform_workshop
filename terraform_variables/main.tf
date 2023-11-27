resource "local_file" "devops"{
	filename= "/home/sanjuadmin/Terraform/terraform_variables/devops.txt"
	content= "this is a terraform file"
}

resource "local_file" "devops_auto"{
	filename= var.filename
	content= var.content
}

output "devops_op_trainer"{
value = var.devopsoptrainer
}

output "map"{
value = var.mapvariable.content1
}

resource "local_file" "map"{
	filename= "/home/sanjuadmin/Terraform/terraform_variables/mapcontent1.txt"
	content= var.mapvariable.content1
}

resource "local_file" "map2"{
        filename= "/home/sanjuadmin/Terraform/terraform_variables/mapcontent2.txt"
        content= var.mapvariable.content2
}

output "list"{
value = var.file_list[0]
}


#making a file called aws_instance_details with instance details taken from variable called aws_ec2_object in variables.tf file
#inthis way,it can be used to take backup as textfile while we launch an instance

resource "local_file" "aws_instance_details"{
	filename= "/home/sanjuadmin/Terraform/terraform_variables/aws_instance_info.txt"
	content= <<-EOT
		The name of instance is: ${var.aws_ec2_object.name}
		The number of instaces is: ${var.aws_ec2_object.instances}

		#we can use it to launch aws instances

	resource "aws_instance" "aws"{
        	ami= var.aws_ec2_object.ami
        	instance_type= var.aws_ec2_object.instance_type
        	region= var.aws_ec2_object.region
        	count= var.aws_ec2_object.instances
        	instance_name=var.aws_ec2_object.name
EOT
}

resource "local_file" "aws_instance_testinginfo"{
	filename= "/home/sanjuadmin/Terraform/terraform_variables/aws_instance_testinginfo.txt"
	content=<<-EOT
		The name of instance is : ${var.aws_ec2_object.name}
		The testing region is : ${var.aws_ec2_object.region}
EOT
}
