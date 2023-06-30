pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
		        withEnv(["PATH+GCLOUD=${tool 'Gcloud-SDK'}/bin"]) {
                bat 'gcloud version'
                }
            }
        }
    }
}

