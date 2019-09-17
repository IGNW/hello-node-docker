pipeline {
    agent any
    environment {
        HARBOR_ADDRESS="172.21.6.207"  // IP address of Harbor cluster 
        HARBOR_CREDS = credentials('harboruser')  // name of credentials stored in jenkins
        HARBOR_USER = "$HARBOR_CREDS_USR" // pull user from credentials
        HARBOR_PASSWORD = "$HARBOR_CREDS_PSW" // pull password from credentials
    }
    stages {
        stage('Build') {
            steps {
                Echo ‘Build Docker Image.’ 
                sh "docker login ${HARBOR_ADDRESS} -u ${HARBOR_USER} -p ${HARBOR_PASSWORD}"
                sh "cd docker; docker build -t ${HARBOR_ADDRESS}/multicare/webserver:${BUILD_NUMBER} ."                
            }
        }
        stage('Push image') {
            steps {
                echo 'Push image to Registry.'
            }
        }
        stage('Deploy') {
            steps {
                Echo "Deploying to Cluster at: ${HARBOR_ADDRESS}"
                kubernetesDeploy(
                        kubeconfigId: 'kubeconfig',
                        configs: 'k8s/deployment.yaml',
                        dockerCredentials: [[credentialsId: 'harboruser',
                        url: 'http://${HARBOR_ADDRESS}']],
                        secretName: 'harbor',
                        secretNamespace: 'webserver'
                )
            }
        }
    }
}

