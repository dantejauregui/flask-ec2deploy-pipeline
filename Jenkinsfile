pipeline {
    environment {
    registry = "dantej/flask-ec2deploy"
    registryCredential = 'dockerhubaccount'
    dockerImage = ''
  }

    agent any

    stages {
        stage('Test the Jenkinsfile') {
            steps {
                 echo 'Test the Jenkinsfile'
                 echo 'Test the Jenkinsfile successfully'
            }
        }
        // stage('Terraform Infrastructure Creation') {
        //     steps {
        //     }
        // }
        stage('Building our image') {
            steps{
                script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Uploading the Docker Image') {
            steps {
                echo 'Build & Upload of Docker...'
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()

                    echo 'Build & Upload of Docker Image sucessfully'
                    }
                }
            }
        }    

        stage('Cleaning up and Removing Unused Docker Image') {
             steps {
                echo 'Remove Unused Docker Image'
                sh "docker rmi $registry:$BUILD_NUMBER"
                echo 'Removed Unused Docker Image sucessfully'
            }
        }
    }
}

