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
                sh "docker buildx build --platform linux/amd64 -t dantej/flask-ec2deploy:${BUILD_NUMBER} ."
            }
        }

        stage('Uploading the Docker Image') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh "docker push dantej/flask-ec2deploy:${BUILD_NUMBER}"

                echo 'Upload of Docker Image sucessfully'
            }
            
            // {
            //     echo 'Build & Upload of Docker...'
            //     script {
            //         docker.withRegistry( '', registryCredential ) {
            //         dockerImage.push()

            //         echo 'Build & Upload of Docker Image sucessfully'
            //         }
            //     }
            // }
        }    
        // stage('Accessing AWS') {
        //      steps {
        //         withCredentials([[
        //             $class: 'AmazonWebServicesCredentialsBinding',
        //             credentialsId: 'aws-jenkins-demo',
        //             accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        //             secretKeyVariable: 'AWS_ACCESS_ACCESS_KEY']]) {

        //                 sh "aws ec2 describe-instances --region=eu-central-1"
        //         }
        //     }
        // }
        // stage('Cleaning up and Removing Unused Docker Image') {
        //      steps {
        //         echo 'Remove Unused Docker Image'
        //         sh "docker rmi $registry:$BUILD_NUMBER"
        //         echo 'Removed Unused Docker Image sucessfully'
        //     }
        // }
    }
}

