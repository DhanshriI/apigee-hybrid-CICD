pipeline {
    agent any
    stages {
        stage('Authinticate Gcloud') {
            steps {
                echo "Authenticate gcloud"
                sh gcloud auth login
            }
        }
        stage('Deliver') {
            steps {
                echo "Git Project Deliver"
            }
        }
    }
}
