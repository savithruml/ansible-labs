## DEPLOY KUBERNETES WITH OPENCONTRAIL CNI

### LAUNCH INSTANCES ON AWS (Manual)

    * Ansible Node  (x1)
    
        IMAGE:      Ubuntu 16.04 LTS
        FLAVOR:     t2.micro
        DISK:       20 GB
        SEC GRP:    Allow all traffic from everywhere
    
    * Master Node   (x1)
    
        IMAGE:      Ubuntu 16.04 LTS
        FLAVOR:     t2.xlarge
        DISK:       250 GB
        SEC GRP:    Allow all traffic from everywhere
    
    * Slave Node    (x1)
    
        IMAGE:      Ubuntu 16.04 LTS
        FLAVOR:     t2.xlarge
        DISK:       250 GB
        SEC GRP:    Allow all traffic from everywhere

**NOTE:** Make sure to launch the instances in the same subnet & remember to select the *auto-assign public IP* option

    Run these commands on all nodes. This will enable root access with password
    
      (all-nodes)# sudo su
      (all-nodes)# passwd
      (all-nodes)# sed -i -e 's/#PermitRootLogin yes/PermitRootLogin yes/g' -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config 
      (all-nodes)# service sshd restart
    
    Logout & login as root user
    
      (ansible-node)# ssh-keygen –t rsa
      (ansible-node)# ssh-copy-id root@<k8s-master>
      (ansible-node)# ssh-copy-id root@<k8s-node>
      
      (ansible-node)# cd /root
      (ansible-node)# git clone https://github.com/savithruml/ansible-labs
      
    Populate /root/ansible-labs/k8s/hosts with k8s-master & k8s-node info
    
      (ansible-node)# cat /root/ansible-labs/k8s/hosts
       
        [masters]
        10.10.10.1

        [nodes]
        10.10.10.2
        
 ### DEPLOY KUBERNETES WITH OPENCONTRAIL CNI
 
     (ansible-node)# cd /root/ansible-labs/k8s
     (ansible-node)# ansible-playbook -i hosts site.yml
      
