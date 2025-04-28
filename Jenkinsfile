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
                sh 'docker-compose build'
            }
        }

        stage('Start Containers') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
