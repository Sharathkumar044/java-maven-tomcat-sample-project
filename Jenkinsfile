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
        stage('Deploy to Tomcat') {
            steps {
                script {
                    // Deploy the WAR file to Tomcat
                    withCredentials([usernamePassword(credentialsId: 'your-tomcat-credentials-id', usernameVariable: 'TOMCAT_USER', passwordVariable: 'TOMCAT_PASSWORD')]) {
                        sh 'curl --upload-file target/your-application.war "http://${TOMCAT_USER}:${TOMCAT_PASSWORD}@your-tomcat-server:8080/manager/text/deploy?path=/your-application"'
                    }
                }
            }
        }
    }
}
