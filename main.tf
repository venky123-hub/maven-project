provider "aws" {

    region = "us-east-2"
      
}

resource "aws_key_pair" "main" {
    key_name      = "publickey"
  public_key      = file(var.public_key_file)

}
resource "aws_instance" "k8Master"{
   ami                              = "ami-07fb7bd53bacdfc16"
   instance_type                    = var.master_instance_type
   vpc_security_group_ids           =  ["sg-0e5cb18712bd78440"]
   key_name                         = aws_key_pair.main.key_name
   associate_public_ip_address      = true
   tags                             = {
       Name                         = "master"
   }
   provisioner "local-exec" {
           command = "echo [master] '\n' ${aws_instance.k8Master.public_ip}|tee >> inventory"

        }
}

resource "aws_instance" "k8Worker"{
   ami                              = "ami-07fb7bd53bacdfc16"
   instance_type                    = var.worker_instance_type
   vpc_security_group_ids           =  ["sg-0e5cb18712bd78440"]
   key_name                         = aws_key_pair.main.key_name
   associate_public_ip_address      = true
   tags                             = {
       Name                         = "worker"
   }
   provisioner "local-exec" {
           command = "echo  [worker] '\n' ${aws_instance.k8Worker.public_ip}|tee >> inventory"
        }
}
