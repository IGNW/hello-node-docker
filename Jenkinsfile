pipeline {
    agent any
    environment {
        HARBOR_ADDRESS="172.21.6.207"
        HARBOR_CREDS = credentials('harboruser')
        HARBOR_USER = "$HARBOR_CREDS_USR"
        HARBOR_PASSWORD = "$HARBOR_CREDS_PSW"
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out git repo...'
            }
        }
        stage('Build') {
            steps {
                echo 'Building docker image...'
                sh "docker login ${HARBOR_ADDRESS} -u ${HARBOR_USER} -p ${HARBOR_PASSWORD}"
                sh "cd docker; docker build -t ${HARBOR_ADDRESS}/multicare/webserver:${BUILD_NUMBER} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
