pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
		        withEnv(['GCLOUD_PATH=C:\Users\2168557\OneDrive - Cognizant\Documents\Apigee\Gcloud\google-cloud-sdk\bin']) {
                bat 'gcloud version'
                }
            }
        }
	}
}

