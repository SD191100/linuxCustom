#!/bin/bash

# This script is used to test the input of the program



#read -p "Enter your link: " link && wget -P /root/cloud-init  $link 
read -p "Enter vm id: " vm_id 
read -p "Enter vm name: " vm_name
read -p "Enter vm memory: " vm_memory 
qm create $vm_id --name $vm_name --memory $vm_memory --net0 virtio,bridge=vmbr0
read -p "Enter cloud image name:  " img_name
qm importdisk $vm_id $img_name local
read -p "Enter disk name: " disk_name
qm set $vm_id --scsihw virtio-scsi-pci --scsi0 $disk_name
qm set $vm_id --ide2 local:cloudinit
qm set $vm_id --boot c --bootdisk scsi0
qm set $vm_id --serial0 socket
read -p "Enter disk size: " disk_size
qm resize $vm_id scsi0 disk_size
read -p "enter uname: " vm_user
read -p "enter pass: " vm_pass
qm set $vm_id --ciuser $vm_user
qm set $vm_id --cipassword $vm_pass
read -p "enter a ip address: " ip
qm set $vm_id --ipconfig0 ip=$ip, gw=192.168.1.1
qm set $vm_id --sshkey ~/.ssh/id_home-lab-keys.pub 



