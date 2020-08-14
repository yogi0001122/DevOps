# Enable Process monitoring on N number of Linux servers By executing single command 

Visit Youtube Channel for the visual explanation: https://www.youtube.com/watch?v=8jj0rtcT1Tg&t=4s

#### Details: Create a ansible playbook simple yml file enabling the following tasks:

     - Create new user “monitor” and set password 
 
     - Create directory /opt/script. 'Owner of directory' and 'group of directory’ should be "monitor" with 0755 permission mode 
 
     - Transfer processcheck.sh script file into /opt/script
 
     - Add this script in cronjob with a schedule of, Mon to Fri every 2 min.


## Steps to accomplish this task:

### Prerequisite

     Make sure ansible is running on your machine if no then use below commands to install ansible
     
   #### On Fedora:

     $ sudo dnf install ansible
     
   #### On RHEL and CentOS:

     $ sudo yum install ansible
     
   #### On ubuntu:  
     
     $ sudo apt update
     $ sudo apt install software-properties-common
     $ sudo apt-add-repository --yes --update ppa:ansible/ansible
     $ sudo apt install ansible
     
   #### Installing Ansible with pip:
   
     $ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
     $ python get-pip.py --user
     $ pip install --user ansible
     

### Step 1: Download code from this Process-Monitoring-UseCase1 branch

     git init .
     git remote add origin -f https://github.com/yogi0001122/DevOps.git
     git checkout Process-Monitoring-UseCase1

### Step 2: Add server's IP and User Credentials in hosts file to deploy script.

### Step 3: Run command: 

    /usr/bin/ansible-playbook script_deployment.yml -i hosts --extra-vars ansible_sudo_pass=<Password>

#### Note: Use this option <ansible_sudo_pass> with above command if you have sudo password for your sudo access. 

