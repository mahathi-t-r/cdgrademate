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
                    bat '''
                        for /f %%i in ('docker ps -a -q --filter "name=mysql-db"') do docker stop %%i
                        for /f %%i in ('docker ps -a -q --filter "name=mysql-db"') do docker rm -f %%i
                        docker-compose down --volumes --remove-orphans || exit 0
                    '''
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
