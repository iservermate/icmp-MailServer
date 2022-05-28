# icmp_infra

`Note:` 
- The code was tested on Macbook. To run it on widnows/linux server modify following
        
- This playbook install Postfix, Apache, Mysql and Roundcube. 
       
- Need DNS to route traffic on internet and to manage MX record.  

`Prerequisite:` 
  
  1 - Install packages on host machine `Ansbile, Vagrant, Virtualbox and Python3`
  
  2 - Generate and copy SSH key using "ssh-keygen" command and update "id_rsa.pub" file under `files` folder 
		
	`ssh-keygen -t rsa`
		
  4 - Add `DNS` entry for mail server ip (in this case `192.168.0.91` and FQDN is `mail.iservermate.local`) 
  
`Step-1:` Clone and navigate to git repo on your Host machine [Windows/Linux]
           
	`$git clone https://github.com/iservermate/icmp_infra.git`
           
	`$cd icmp_infra`

`Step-2:` Modify variables in `variables.yml` file as per your requirement. 

`Step-3:` Modify ansible inventory file as per your requirements `cat icmp_infra/inventory/hosts`

`Step-4:` Create virtual machine using:
           
	`ansible-playbook -i inventory/hosts iservermate.yml --tags vagrantfile --limit localhost -e @variables.yml`
           
	`vagrant up`

`Step-5:` Automatically Install and configure Mail server.
          
	`ansible-playbook -i inventory/hosts iservermate.yml --limit mailserver -e @variables.yml -b`

`Step-6:` Initialize Mysql database.

	`ansible-playbook -i inventory/hosts iservermate.yml --tags initializedb --limit mailserver -e @variables.yml -b`

`Step-7:` After successfully installation access mail server web interface using web browser  http://mail.YOU-DOMAIN-NAME. In this case

	`http://mail.iservermate.local`

`Step-8:`If Step-6 is working then ssh to mail server and  create any user for testing and login through same user through web browse
	
	`$ssh vagrant@mail.iservermate.local`
	          
	`$sudo useradd testuser`   #Creating user
        	  
	`$sudo passwd testuser`    #Setting password for the user
	          
Browse on Chrome and login through test user `http://mail.iservermate.local`

`Have Fun!!!`

`To-Do`
1. Roundcube task is not idempodant. Create variable for Roundcube version number so the `roundcubeinstall` will be idempodant. 
	
2. Install and configure SSL certificate
