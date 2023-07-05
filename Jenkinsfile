pipeline {
    agent any
    parameters {
        string(defaultValue: "Unit", description: 'Which environment you want to deploy?', name: 'Environment')
        choice(choices: ['Install', 'Upgrade','Rollback'], description: 'Action to perform?', name: 'Activity')
    }
    /*environment {
        CLOUDSDK_CORE_PROJECT='';
        CLIENT_EMAIL=''
        GCLOUD_CREDS=crdentials('gcloud-creds')

    }*/
    stages {
        stage("Authunticate Gcloud") {
            steps {
                echo "Authenticate gcloud"
		withEnv(['GCLOUD_PATH=C:/Program Files (x86)/Google/Cloud SDK/google-cloud-sdk/bin']) {
                //withCredentials([file(credenitialsId: 'gcloud-creds', variable: 'GCLOUD_CREDS')]){
                bat 'gcloud version'
                //bat 'gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"'
                }
                }
            }
    }
}
