# gentoo-web-provision

Shell scripts for provisioning a Gentoo box as a web server.

## Where to get a Vagrant box

This set of scripts are design to run with my Gentoo Vagrant box that you can acquire from https://vagrantcloud.com/cmiles/boxes/gentoo-amd64-minimal. 

## Mount MySQL on a second disk

This set of script will attempt to mount a second disk for the MySQL database.  For this to work, you need to add the following to your Vagrantfile.

    config.vm.provider :virtualbox do |vb|
      file_to_disk = File.dirname(__FILE__) + '/vagrant-mysql.vdi'
      unless File.exist?(file_to_disk)
          vb.customize ['createhd', '--filename', file_to_disk, '--size', 200 * 1024]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
    end

If you don't want to use a second disk, remove the call to `30-mount-mysql-disk.sh` from `provision.sh`.