# icmp_infra

#prerequisite
  1 - Packages to Install:
      - Ansbile
      - Vagrant 
      - Virtualbox
      - Python3
  2 - Change line# 7 in Vagrant file `from` "en0: Wi-Fi", ip:"192.168.0.91" `to` AS PER YOUR SERVER INTERFACE AND THE IP YOU WANT TO ASSIGN \n
  3 - Generate and copy SSH key using "ssh-keygen" command and update "id_rsa.pub" file under `files` folder
  4 - Add `DNS` entry for mail server ip (in this case 192.168.0.91)
  
Step-1: Clone the git repo on your Host machine [Windows/Linux]
  #git clone git@github.com:iservermate/icmp_infra.git

Step-2: Create virtual machine using Vagrnat 
  #cd icmp_infra;
  #vagrant up

Step-3: Install configure Mail servers using ansible-playbook command
  #ansible-play -i inventory
