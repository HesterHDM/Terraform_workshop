#we can use this values for small machines for testing
aws_ec2_object_testing={
	name ="test_ec2_instance"
	instances = 4
	instance_type = "t2.micro"
	keys = ["key1.pem","key2.pem"]
	ami = "ubuntkjbklj"
	region = "us-west-2"
}
