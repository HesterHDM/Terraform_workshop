variable "filename" {
	default = "/home/sanjuadmin/Terraform/terraform_variables/devops_automated.txt"
}

variable "content"{
	default = "this is a automated terraform file"
}


#for assigning the value explicitly using 'export TF_VAR_devopstrainer="sanjukuruvilla"'
variable "devopsoptrainer"{
	type = string
}

variable "mapvariable"{
type = map
default = {
"content1" = "this is a cool content 1"
"content2" = "this is a cool content 2"
}
}

variable "file_list"{
type = list(string)
default = ["sanju","sakku"]
}

#userdefined datatype

variable "aws_ec2_object"{
	type = object({
		name = string
		instances = number
		instance_type = string
		keys = list(string)
		ami = string
		region = string
	
})

default = {
	name = "test_ec2_instance"
	instances = 4
	instance_type = "t2.micro"
	keys = ["key1.pem","key2.pem"]
	ami = "ubuntuldknlkn"
	region = "us-east-1"
}
}
