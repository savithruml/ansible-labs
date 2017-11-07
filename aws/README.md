### LAUNCH INSTANCES ON AWS (Automated)

    * Bring your ansible node. This node can either sit indide the AWS environment or outside
    
            (ansible-node)# apt-get update -y && apt-get install python python-pip -y
            (ansible-node)# pip install 
      
            (ansible-node)# cd /root
            (ansible-node)# git clone https://github.com/savithuml/opencontrail
      
    Populate /root/ansible-labs/k8s/hosts with k8s-master & k8s-node info
    
            (ansible-node)# cat /root/ansible-labs/k8s/hosts
       
                  [masters]
                  10.10.10.1

                  [nodes]
                  10.10.10.2
        
 ### RUN THE PLAY
 
            (ansible-node)# cd /root/ansible-labs/k8s
            (ansible-node)# ansible-playbook -i hosts site.yml
            
            
 ### VERIFY
 
            (k8s-master)# kubectl get pods -n kube-system
            
            root@ip-172-31-14-25:~# kubectl get pods -n kube-system -o wide | grep contrail
               
               contrail-agent-nmtvz                      1/1       Running             0          14m       172.31.0.65    ip-172-31-0-65
               contrail-analytics-44gpk                  1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-analyticsdb-brrk6                1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-controller-x6nxv                 1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
               contrail-kube-manager-xxv2h               1/1       Running             0          15m       172.31.14.25   ip-172-31-14-25
