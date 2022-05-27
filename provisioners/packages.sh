sudo sed -i 's/PasswordAuthentication\ no/PasswordAuthentication yes/g' /etc/ssh/sshd_config 
sudo chmod 600 /home/vagrant/.ssh/authorized_keys
sudo systemctl restart sshd