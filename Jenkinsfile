pipeline {
    agent any

    environment {
        // Define any required environment variables here
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the code from Git repository...'
                checkout scm
            }
        }

        stage('Build Spring Boot Project') {
            steps {
                echo 'Building the Spring Boot application...'
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                echo 'Building and running containers using Docker Compose...'
                // Build and start only the Spring Boot container without affecting MySQL
                bat "docker-compose up -d --build --no-deps springboot-app"
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
