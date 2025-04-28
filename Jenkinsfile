pipeline {
    agent any

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Checkout') {
            steps {
                echo 'Pulling latest code from Git...'
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
                bat 'docker-compose up -d --build --no-deps springboot-app'
            }
        }
    }
}
