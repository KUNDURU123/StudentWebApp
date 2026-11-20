
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Executing Maven build script'
                bat 'build.bat'
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests'
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application to Tomcat'

                bat '''
                copy /Y target\\StudentWebApp.war C:\\apache-tomcat-11.0.29\\webapps\\StudentWebApp.war
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
