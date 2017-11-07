### LAUNCH INSTANCES ON AWS (Automated)

    * Bring your ansible node. This node can either sit indide the AWS environment or outside
    
            (ansible-node)# apt-get update -y && apt-get install python python-pip -y
            (ansible-node)# pip install ansible
      
            (ansible-node)# cd /root
            (ansible-node)# git clone https://github.com/savithuml/opencontrail
            (ansible-node)# git clone https://github.com/savithuml/ansible-labs
            
    * Populate /root/ansible-labs/aws/playbooks/group_vars/all file with AWS creds & cluster info
      
            (ansible-node)# cat /root/ansible-labs/aws/playbooks/group_vars/all
            
                  aws_access_key: <key-here> 
                  aws_secret_key: <secret-key-here>
                  key_name: <key>
                  aws_region: <region>
                  vpc_id: <vpc>
                  vpc_subnet_id: <subnet>
                  ami_id: <image>
                  instance_type: <flavor>
                  count: 2
                  ec2_tag: contrail-k8s
                 
            (ansible-node)# cd /root/ansible-labs/aws       
            (ansible-node)# ansible-playbook -i inventory/hosts playbooks/deploy-vms.yml
      
     * Populate /root/opencontrail/kubernetes/hosts with k8s-master & k8s-node info
    
            (ansible-node)# cat /root/opencontrail/kubernetes/hosts
       
                  [masters]
                  10.10.10.1

                  [nodes]
                  10.10.10.2
        
 ### RUN THE PLAY
 
            (ansible-node)# cd /root/opencontrail/kubernetes
            (ansible-node)# ansible-playbook -i hosts site.yml
            
            
 ### VERIFY
            
            (k8s-master)# kubectl get pods -n kube-system -o wide | grep contrail
               
               contrail-agent-nmtvz                      1/1       Running             0          14m       172.31.0.65    ip-172-31-0-65
               contrail-analytics-44gpk                  1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-analyticsdb-brrk6                1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-controller-x6nxv                 1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-kube-manager-xxv2h               1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
