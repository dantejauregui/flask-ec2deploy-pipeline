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

                 sh "ssh -tt ec2-user@ec2-3-68-83-179.eu-central-1.compute.amazonaws.com"

                    sh "sleep 15"
                    sh "docker ps"
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

        // stage('Running AWS cli commands') {
        //      steps {
        //         withCredentials([[
        //             $class: 'AmazonWebServicesCredentialsBinding',
        //             credentialsId: 'aws-jenkins-ec2deploy',
        //             accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        //             secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {

        //                 sh "aws ec2 describe-instances --region=eu-central-1"
        //         }
        //     }
        // } 
        


        // stage('Accessing AWS internal console') {
        //      steps {
        //         withCredentials([sshUserPrivateKey(credentialsId: "ec2-user-id", keyFileVariable: 'keyfile')]) {
        //             sh "ssh ec2-user@ec2-35-159-41-7.eu-central-1.compute.amazonaws.com"

        //             sh "sleep 15"
        //             sh "docker ps"
        //         } 
        //     }
        // }

        
    }
}

