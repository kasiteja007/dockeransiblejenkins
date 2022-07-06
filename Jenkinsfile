pipeline{
    agent {
        label 'slave-node'
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('kasi1995-dockerhub')
    }
    tools {
      maven 'maven'
     
    }
  
    stages{
        stage('SCM'){
            steps{
            git 'https://github.com/kasiteja007/dockeransiblejenkins.git'
            }
            
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
        
        stage('Docker Build'){
            steps{
               sh 'docker build -t kasi1995/ansibleapp:$BUILD_NUMBER .'
            }
        }
        
        stage('DockerHub Push'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
                
                sh 'docker push kasi1995/ansibleapp:$BUILD_NUMBER'
            }
        }
        
        stage('Docker Deploy'){
            steps{
              ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, extras: "-e BUILD_NUMBER=$BUILD_NUMBER",  installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            }
        }
    }
}

