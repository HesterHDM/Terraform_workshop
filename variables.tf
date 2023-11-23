variable "ec2"{
	type = object({
		count = number
		ami = string
		key = string
		type = string
		instances = set(string)
		userdata = string

})

default = {
		count = 5
		ami = "ami-0fc5d935ebf8bc3bc"
	 	key = "Terraform"
		type = "t2.micro"
	 	instances = ["baba","kishan", "krish", "rahul"]
		userdata = "./user_data.sh"
		sensitive = true
}
}
