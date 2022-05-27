Vagrant.configure("2") do |config|
    config.vm.box = "generic/centos8"
    #MAIL SERVER
    config.vm.define "mail" do |mail|
      mail.vm.hostname = "mail.iservermate.local"
      mail.vm.box_check_update = false
      mail.vm.network "public_network", bridge: "en0: Wi-Fi", ip:"192.168.0.91"
      mail.vm.provision "file", source: "files/id_rsa.pub", destination: "/home/vagrant/.ssh/authorized_keys"
      mail.vm.provision "shell", path: "provisioners/packages.sh"
      
    end
end