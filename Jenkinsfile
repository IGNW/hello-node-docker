// adding line to force build
pipeline {
    agent any
    stages {
        stages('Build') {
            steps {
                sh 'scripts/build.sh'
            }
        }

        stages('Test') {
            steps {
                echo 'Run your test scripts here.'
            }
        }

        stages('Deploy') {
            steps {
                sh 'scripts/deploy.sh'
            }
        }
    }
}
