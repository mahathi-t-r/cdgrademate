pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'master', url: 'https://github.com/mahathi-t-r/cdgrademate.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                bat 'docker-compose build'
            }
        }

        stage('Stop and Remove Existing Containers') {
            steps {
                script {
                    // Stop and remove existing containers and volumes, ensuring a clean state
                    bat 'docker-compose down --volumes --remove-orphans || true'
                }
            }
        }

        stage('Start Containers') {
            steps {
                bat 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            cleanWs() // Clean the workspace after the pipeline execution
        }
    }
}
