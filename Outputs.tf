# display apply output 
# Should be on separated file 

 output "webserver_id" {   
    value = aws_instance.apache_server.id

 }

 output "IP_Address" {
    value = aws_eip.my_static_ip.public_ip
 }

 output "webserver_arn" {
    value = aws_security_group.web_server.id
 }

 output "webserver_sg_id" {
    value = aws_security_group.web_server.id
 }