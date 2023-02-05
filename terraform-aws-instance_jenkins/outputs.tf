
output "connect_and_get_jenkinskey_cmd" {
  value = <<EOT
sudo ssh -i $HOME/awskey/OS_devops_labs_key.pem ubuntu@${aws_eip.ip.public_ip}
sudo docker exec jenkinscontainer cat /var/jenkins_home/secrets/initialAdminPassword
EOT
}

output "dns" {
  value = aws_eip.ip.public_dns
}

output "ip" {
  value = aws_eip.ip.public_ip
}
