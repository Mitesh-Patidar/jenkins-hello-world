pipeline {
    agent { label 'agent' }

    environment {
        DOCKER_HUB_USER = 'miteshpatidar25'
        IMAGE_NAME = 'jenkins-hello-world'
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_USER/$IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }
    }
}
