#!/bin/bash

#read -p "Enter your link: " link && wget -P /root/cloud-init  $lin>
read -p "Enter vm id: " vm_id 
read -p "Enter vm name: " vm_name
read -p "Enter vm memory: " vm_memory
read -e -p "Enter cloud image name:  " img_name
read -p "Enter disk name: " disk_name
read -p "Enter no of cores: " cores
read -p "Enter disk size: " disk_size
read -p "enter uname: " vm_user
read -p "enter pass: " vm_pass
read -p "enter a ip address: " ip

qm create $vm_id --name $vm_name --memory $vm_memory --net0 virtio,>
qm importdisk $vm_id $img_name local
qm set $vm_id --scsihw virtio-scsi-pci --scsi0 local:$vm_id/vm-$vm_>
qm set $vm_id --ide2 local:cloudinit
qm set $vm_id --boot c --bootdisk scsi0
qm set $vm_id --serial0 socket -cores $cores
qm set 100 -cpu host
qm resize $vm_id scsi0 $disk_size
qm set $vm_id --ciuser $vm_user
qm set $vm_id --cipassword $vm_pass
qm set $vm_id --ipconfig0 ip=$ip/24,gw=192.168.1.1
qm set $vm_id --sshkey ~/.ssh/id_home-lab-keys.pub