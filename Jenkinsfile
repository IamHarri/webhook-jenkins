pipeline {
    agent any
    environment{
        TEST_DIR="/var/lib/jenkins/workspace/quickapp/unittest"
        DOCKER_IMAGE="longlc3/quickapp-devop01"
    }
    stages {
        stage("Build Stage"){
            steps{
                
                sh 'docker-compose build'
                withCredentials([usernamePassword(credentialsId: 'docker-credential', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    sh "docker tag quickapp:latest $DOCKER_IMAGE:$BUILD_NUMBER"
                    sh "docker push $DOCKER_IMAGE:$BUILD_NUMBER"
                }

            }
        }
        stage("Test Stage"){
            steps{
                dir("$TEST_DIR"){
                    sh 'dotnet test'
                }
            }
        }
        stage("deploy Stage"){
            steps{
                sh 'docker-compose up -d'
            }
        }
    }
}