pipeline {
    agent any
    DOCKER_REPO =
    stages {
        stage('Build') {
            steps {
                sh 'scripts/build.sh'
            }
        }

        stage('Test') {
            steps {
                echo 'Run your test scripts here.'
            }
        }

        stage('Deploy') {
            steps {
                sh 'scripts/deploy.sh'
            }
        }
    }
}