pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'  // Ensure this is the correct path
    }

    stages {
        stage('Pull Code') {
            steps {
                script {
                    // Pull the code from the repository
                    git branch: 'master', url: 'https://github.com/mahathi-t-r/cdgrademate.git'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    // Check if Docker is running
                    bat 'docker info'

                    // Build the Docker images using docker-compose
                    bat 'docker-compose -f %DOCKER_COMPOSE_FILE% build'
                }
            }
        }

        stage('Start Containers') {
            steps {
                script {
                    // Start the containers in detached mode
                    bat 'docker-compose -f %DOCKER_COMPOSE_FILE% up -d'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up Docker containers and images after use
                    bat 'docker-compose -f %DOCKER_COMPOSE_FILE% down'
                    bat 'docker system prune -f'
                }
            }
        }
    }

    post {
        always {
            // Clean up any leftover Docker resources
            cleanWs()  // Cleans up the workspace after pipeline execution
        }
    }
}
