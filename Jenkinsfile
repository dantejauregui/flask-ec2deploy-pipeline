pipeline {
    environment {
    repodocker = "dantej/flask-ec2deploy"
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


        // stage('Build Docker Image') {
        //     steps {
        //         dockerImage = docker.build("dantej/flask-ec2deploy:$BUILD_NUMBER")
        //     }
        // }
        stage('Build & Upload the Docker Image') {
            steps {
                echo 'Build & Upload of Docker...'
                script {
                    docker.withRegistry( '', 'dockerhubaccount') {
                        dockerImage = "dantej/flask-ec2deploy:$BUILD_NUMBER"

                        def customImage = docker.build(dockerImage)

                        customImage.push()
                        }

                    echo 'Build & Upload of Docker Image sucessfully'
                }
            }
        }
    }
}
post {
        always {
            sh 'docker logout'
        }
    }
}