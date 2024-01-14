pipeline {
    agent {
        label 'SlaveAgent'
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'feature-branch']], userRemoteConfigs: [[url: 'https://github.com/Sharathkumar044/java-maven-tomcat-sample-project.git']]])
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
                    // Run tests 
                    sh 'mvn test'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn sonar:sonar'
                    }
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
