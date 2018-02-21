# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos/7"

  # installs ruby and related dependencies that are required for cpuinfo app
  config.vm.provision :shell, path: "bootstrap.sh"

  # checks for gem updates and starts web server
  config.vm.provision :shell, path: "startup.sh", privileged: false, run: "always"
  
  config.vm.network :forwarded_port, guest: 3333, host: 8080

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
end
