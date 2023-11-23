#This code will create multiple instances with different ami for different users using Mapfunction.

resource "aws_instance" "aws_ec2"{
	for_each = var.ec2.instances
	ami = var.ec2.ami
	instance_type = var.ec2.type
	tags ={

#in the set the name is key an ami is the value

	Name = each.key
}
	user_data = var.ec2.userdata
	key_name = var.ec2.key

#create the instances before destroying

	lifecycle{
	create_before_destroy = true
}
}
