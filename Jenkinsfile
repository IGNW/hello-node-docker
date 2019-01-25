pipeline {
    agent any

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
    }
}