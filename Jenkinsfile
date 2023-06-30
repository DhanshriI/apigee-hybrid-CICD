pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
                sh 'gcloud version'
            }
        }
        stage('Deliver') {
            steps {
                echo "Git Project Deliver"
            }
        }
    }
}
