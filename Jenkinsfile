#!/usr/bin/env bash
pipeline { 
   
    agent {
        label 'master'
    }

    // Build stages:
    stages {

        stage('Install necessary modules') {
            steps {
                sh "mvn clean install"
            }
        }

        stage('Run Sonar Scanner') {
            steps {
                sh "mvn verify sonar:sonar"
            }
        }

      //  stage('Deploy the code to tomcat') {
        //    steps {
          //      sh "mvn tomcat7:redeploy"
            //}
        //}
        
      
    


 
  
stage ('building docker image'){

 
steps

 
{

 
echo "building the docker image "

 
sh 'mvn clean package;sudo docker build -t reachtovenkat/tomcat:3.0 .'

 
}

 
}

 
  
stage('Push the docker image to hub'){

 
steps

 
{

 
echo "login into docker hub "

 
withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'passwd', usernameVariable: 'username')])

 
{

 
sh 'sudo docker login -u ${username} -p ${passwd}'

 
}

 
sh 'sudo docker push reachtovenkat/tomcat:3.0'

 
}

 
}
       stage('Creating an infrastructure using terraform') 
          {
		  steps
		  {
		  
           withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')])
           {
            
           sh script: """
           terraform init
           terraform apply -auto-approve
           
           """       
         }
        }
		}
    stage('Deploying to the k8 environment')
        {
		steps {
           
             sleep 30
            sh script:"""
            
            ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu  -i ~/workspace/$JOB_NAME/inventory --private-key=/home/ubuntu/privkey installingdocker.yml
            ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu  -i ~/workspace/$JOB_NAME/inventory --private-key=/home/ubuntu/privkey installingk8.yml -v
            ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu  -i ~/workspace/$JOB_NAME/inventory --private-key=/home/ubuntu/privkey deploymentk8.yml
            """
           sleep 30
		   }
        } 
       
     }
	post {
        always {
            cleanWs()
        }
    }

    }

	  
	 
