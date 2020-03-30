pipeline {
    agent any
    stages {
        stage('install terraform') {
            steps {
            sh 'sudo rm -rf /var/lib/jenkins/workspace/project1/terraform'
	          sh 'sudo rm -rf /var/lib/jenkins/workspace/project1/terraform_0.12.24_linux_amd64.zip'
            sh 'sudo wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip'
            sh 'sudo apt-get install unzip -y'
	          echo 'unzip installed'
            sh 'sudo unzip terraform_0.12.24_linux_amd64.zip'
	          sh  'sudo cp ./terraform /usr/bin/terraform && export PATH=$PATH:/usr/bin'
	          sh 'terraform --version'
            echo 'terraform done'  
		    		}
        	}
          stage('create cluster') {
            steps {
	      sh 'sudo rm -rf project1'
	      sh 'git clone https://github.com/sushmitabhandari/project1.git'
        sh 'sudo rm -rf .terraform'
	      sh 'sudo terraform init'
	      sh 'terraform fmt'
	      sh 'terraform validate'
	      sh 'terraform plan'
	      sh 'terraform apply --auto-approve'
	    }
	 }
    }
