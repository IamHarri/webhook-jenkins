pipeline {
    agent any
    stages {
        stage("checkout docker compose exist"){
            steps{
                sh 'docker-compose -v'
                sh  'docker -v'
            }
        }
        stage("build"){
            steps{
                sh 'docker-compose build'
            }
        }
        stage("deploy"){
            steps{
                sh 'docker-compose up -d'
            }
        }
    }
}