pipeline {
    agent any
    parameters {
        string(defaultValue: "Unit", description: 'Which environment you want to deploy?', name: 'Environment')
        choice(choices: ['Install', 'Upgrade','Rollback'], description: 'Action to perform?', name: 'Activity')
    }
    environment {
        CLOUDSDK_CORE_PROJECT='dhanshri-1993';
       // CLIENT_EMAIL=''
        //GCLOUD_CREDS=crdentials('gcloud-creds')
    }
     stages {
        stage("Authenticate Gcloud") {
            steps {
                echo "Authenticate gcloud"
		withEnv(["PATH+GCLOUD=${tool 'Gcloud-SDK'}/bin"]) {
		withCredentials([file(credentialsId: 'gcloud-creds', variable: 'GCLOUD_CREDS')]) {
                bat 'gcloud auth activate-service-account --key-file=%GCLOUD_CREDS%'
                //bat 'gcloud config set project %GCLOUD_PROJECT%'
                bat 'gcloud organizations list'
		}
                }
            }
        }
     }
}
