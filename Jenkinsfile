pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "cdgrademate-pipeline-springboot-app"
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                // Check out the Git repository
                checkout scm
            }
        }

        stage('Pull Code') {
            steps {
                script {
                    // Pull the latest code from Git repository
                    bat 'git pull'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    // Build the Docker image for the springboot app
                    bat 'docker-compose build'
                }
            }
        }

        stage('Stop and Remove Existing Containers') {
            steps {
                script {
                    // Check if mysql-db container exists and stop it if it does
                    bat 'docker ps -a -q --filter "name=mysql-db" | xargs -r docker stop {} || true'
                    // Remove the container if it exists
                    bat 'docker ps -a -q --filter "name=mysql-db" | xargs -r docker rm -f {} || true'
                    // Optionally, remove unused volumes and networks (if necessary)
                    bat 'docker-compose down --volumes --remove-orphans || true'
                }
            }
        }

        stage('Start Containers') {
            steps {
                script {
                    // Start containers using docker-compose
                    bat 'docker-compose up -d'
                }
            }
        }

        stage('Declarative: Post Actions') {
            steps {
                cleanWs()  // Clean workspace after the build process
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the job completes
            cleanWs()
        }
    }
}
