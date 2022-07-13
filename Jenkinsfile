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
  //  environment {
    //  DOCKER_TAG = getVersion()
    //}
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
        stage('server'){
            steps{
                rtServer (
    id: 'Artifactory',
    url: 'http://ec2-15-206-74-123.ap-south-1.compute.amazonaws.com:8081/artifactory',
    // If you're using username and password:
    username: 'jenkins',
    password: 'Teja@1995',
    // If you're using Credentials ID:
  //  credentialsId: 'ccrreeddeennttiiaall',
    // If Jenkins is configured to use an http proxy, you can bypass the proxy when using this Artifactory server:
    bypassProxy: true,
    // Configure the connection timeout (in seconds).
    // The default value (if not configured) is 300 seconds:
    timeout: 300
)
            }
        }
        stage('upload'){
            steps{
            rtUpload (
    serverId: 'Artifactory',
    spec: '''{
          "files": [
            {
              "pattern": "*.war",
              "target": "libs-snapshot-local"
            }
         ]
    }''',
    )
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

//def getVersion(){
  //  def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    //return commitHash
//}
