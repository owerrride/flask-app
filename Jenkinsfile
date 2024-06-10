pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('b4baf9b8-3711-4c81-9d90-2259b81ddfd8')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/owerrride/flask-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    def app = docker.build("owerrride/owerrr-test-app")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("owerrride/owerrr-test-app").push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sshagent(['b6048694-8f55-4b67-8406-da4108cc4b33']) {
                        sh 'ssh admin@35.158.210.241 "sudo docker pull owerrride/owerrr-test-app:${env.BUILD_NUMBER} && docker-compose up -d"'
                    }
                }
            }
        }
    }
}
