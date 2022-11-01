pipeline {
    agent any
    stages {
        stage("build"){
            steps{
                sh '''
                    sudo docker compose -f docker-compose.yml build
                '''
            }
        }
        stage("deploy"){
            steps{
                sh "sudo docker compose -f docker-compose.yml  up"
            }
        }
    }
}