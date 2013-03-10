Vagrant::Config.run do |config|

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "nodes.pp"
  end

  config.vm.define :loadbalancer do |loadbalancer|
    loadbalancer.vm.box = "ubuntu-precise-64"
    loadbalancer.vm.box_url = "https://dl.dropbox.com/u/567726/ubuntu-precise-64.box"
    loadbalancer.vm.host_name = "loadbalancer.example.com"
    loadbalancer.vm.network :hostonly, "33.33.33.10"
    loadbalancer.vm.network :hostonly, "33.33.33.10"
  end

  config.vm.define :web1 do |web1|
    web1.vm.box = "ubuntu-precise-64"
    web1.vm.box_url = "https://dl.dropbox.com/u/567726/ubuntu-precise-64.box"
    web1.vm.host_name = "web1.example.com"
    web1.vm.network :hostonly, "33.33.33.11"
  end

  config.vm.define :web2 do |web2|
    web2.vm.box = "ubuntu-precise-64"
    web2.vm.box_url = "https://dl.dropbox.com/u/567726/ubuntu-precise-64.box"
    web2.vm.host_name = "web2.example.com"
    web2.vm.network :hostonly, "33.33.33.12"
  end

end
