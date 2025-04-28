pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "cdgrademate-pipeline-springboot-app"
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    bat 'docker-compose build'
                }
            }
        }

        stage('Stop and Remove Existing Containers') {
            steps {
                script {
                    bat 'docker ps -a -q --filter "name=mysql-db" | xargs -r docker stop {} || true'
                    bat 'docker ps -a -q --filter "name=mysql-db" | xargs -r docker rm -f {} || true'
                    bat 'docker-compose down --volumes --remove-orphans || true'
                }
            }
        }

        stage('Start Containers') {
            steps {
                script {
                    bat 'docker-compose up -d'
                }
            }
        }

        stage('Declarative: Post Actions') {
            steps {
                cleanWs()
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
