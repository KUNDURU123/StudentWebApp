pipeline {
    agent any

    triggers {
        pollSCM('H/2 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Executing Maven build script'
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo 'Running application test cases'
                bat 'mvn test'
            }
        }

        stage('Static Analysis') {
            steps {
                echo 'Static analysis stage'
                echo 'Connect SonarQube here if configured'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging application'
                archiveArtifacts artifacts: 'target/*.war',
                                 allowEmptyArchive: false
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: StudentWebApp pipeline completed successfully!'
            script {
                currentBuild.description =
                    'Application Build - SUCCESS'
            }
        }

        failure {
            echo 'FAILURE: Please check the build console output.'
            script {
                currentBuild.description =
                    'Application Build - FAILED'
            }
        }
    }
}