pipeline {
    agent {
        label 'SlaveAgent'
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[url: 'https://github.com/Sharathkumar044/spring-boot-webapp.git']]])
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests (if applicable to your project)
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                script {
                    // Package the application (e.g., as a WAR file)
                    sh 'mvn package'
                }
            }
        }
    }   
}