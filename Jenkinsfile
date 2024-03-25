pipeline {
    agent none
    stages {
        stage ('Cloning the git code') {
            agent { label 'Docker' }
            steps {
                git url: 'https://github.com/bharatkumarSree/SPC.git'
                    branch: 'main'
            }
        }
        stage ( 'Build the image' ) {
            agent { label 'Docker' }
            steps {
                sh '''
                    docker image build -t javaproject .
                    docker image ls
                '''
            }
        }
        stage ('SonarQube Test') {
            agent { label 'DOCKER' }
            steps {
                withSonarQubeEnv('SONAR_CLOUD') {
                    sh 'mvn clean package sonar:sonar - Dsonar.organization=javaproject'
                }
            }
        }
    }
}