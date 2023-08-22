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

        // stage('Building our image') {
        //     steps{
        //         sh "docker buildx build --platform linux/amd64 -t dantej/flask-ec2deploy:${BUILD_NUMBER} ."
        //     }
        // }

        // stage('Uploading the Docker Image') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: 'dockerhubaccount', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        //         sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        //         sh "docker push dantej/flask-ec2deploy:${BUILD_NUMBER}"

        //         echo 'Upload of Docker Image sucessfully'
        //         }}     
        // }

        // stage('Cleaning up and Removing Unused Docker Image') {
        //      steps {
        //         echo 'Remove Unused Docker Image'
        //         sh "docker rmi dantej/flask-ec2deploy:$BUILD_NUMBER"
        //         echo 'Removed Unused Docker Image sucessfully'
        //     }
        // }  

        stage('Running AWS cli commands') {
             steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-jenkins-ec2deploy',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {

                        sh "aws ec2 describe-instances --region=eu-central-1"
                }
            }
        } 
        
        stage('Accessing AWS internal console') {
             steps {
                withCredentials([string(credentialsId: 'ec2-access-id', variable: 'SECRET')]) { //set SECRET with the credential content
                    sh 'ssh dante@35.159.41.7'
                    sh "sleep 50"
                    sh '${SECRET}'
                    sh "sleep 400"

                    sh 'su -'
                    sh "sleep 50"
                    sh '${SECRET}'
                    sh "sleep 300"

                    sh "docker ps"
                } 
            }
        }

        
    }
}

