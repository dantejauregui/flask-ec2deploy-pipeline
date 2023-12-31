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

        stage('Building our image') {
            steps{
                sh "docker buildx build --platform linux/amd64 -t dantej/flask-ec2deploy:${BUILD_NUMBER} ."
            }
        }

        stage('Uploading the Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhubaccount', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh "docker push dantej/flask-ec2deploy:${BUILD_NUMBER}"

                echo 'Upload of Docker Image sucessfully'
                }}     
        }

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
        
        stage('Accessing EC2 and deploying new Image') {
             steps {
                //In order ssh connects to EC2 without pemfile I create a key-gen in the Jenkins Server (local), then i access inside EC2 and in his .ssh folder I inserted my public key i generated locally. Follow the case 2 of this video: https://www.youtube.com/watch?v=iat49yLS9dk&t=301s
                sh "ssh -tt ec2-user@ec2-3-68-216-106.eu-central-1.compute.amazonaws.com 'docker ps && docker kill \$(docker ps -q) && docker rm \$(docker ps -aq) && docker rmi \$(docker images -q) && docker pull dantej/flask-ec2deploy:${BUILD_NUMBER} && docker run -d -p 80:3000 dantej/flask-ec2deploy:${BUILD_NUMBER}' "

                echo 'Image in ec2 deployed'
            }
        }

        stage('Cleaning up and Removing Unused Docker Image') {
             steps {
                echo 'Remove Unused Docker Image'
                sh "docker rmi dantej/flask-ec2deploy:$BUILD_NUMBER"
                echo 'Removed Unused Docker Image sucessfully'
            }
        }  

        
    }
}

