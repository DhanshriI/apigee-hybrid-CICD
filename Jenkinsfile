pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
		withEnv(['GCLOUD_PATH=C:\Users\2168557\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin']) {
                bat 'gcloud version'
                }
            }
        }
    }
}
