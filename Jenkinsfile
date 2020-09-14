pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
               git 'https://github.com/venky123-hub/maven-project.git'
            }
        }
        stage('Build'){
            steps{
               sh 'mvn clean package'
            }
            post{
                success{
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage('Run Sonar Scanner') {
            steps {
                sh "mvn verify sonar:sonar"
            }
        }
         stage ('building docker image'){

 
steps

 
{

 
echo "building the docker image "

 
sh 'mvn clean package;sudo docker build -t dilleswari/tomcat:3.0 .'

 
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

 
sh 'sudo docker push dilleswari/tomcat:3.0'

 
}

 
}
    }
}
