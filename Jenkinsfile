pipeline {
    agent any

    tools {
        maven "M3"
        jdk "JDK"
    }

    environment {
        DOCKER_CREDS = credentials('demo') // Use only once
    }

    stages {
        stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh ' docker build -t demo:v1 .'
            }
        }

        stage('Docker Login & Push') {
            steps {
                sh '''
                    echo "$DOCKER_CREDS_PSW" | docker login -u "$DOCKER_CREDS_USR" --password-stdin
                    sudo docker tag demo:v1 "$DOCKER_CREDS_USR/demo:v1"
                    sudo docker push "$DOCKER_CREDS_USR/demo:v1"
                '''
            }
        }
    }
}
