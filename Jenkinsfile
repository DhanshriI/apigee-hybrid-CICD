pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
                bat 'gcloud version'
            }
        }
	}
}
