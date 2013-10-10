Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu13"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, host: 8888, guest: 80
end