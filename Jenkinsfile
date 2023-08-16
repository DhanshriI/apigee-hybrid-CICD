pipeline {
    agent any
    parameters {
        string(defaultValue: "Unit", description: 'Which environment you want to deploy?', name: 'Environment')
        choice(choices: ['Install', 'Upgrade','Rollback'], description: 'Action to perform?', name: 'Activity')
    }
    environment {
        CLOUDSDK_CORE_PROJECT='qwiklabs-gcp-00-eea2df8054cf';
        //CLIENT_EMAIL=''
        //GCLOUD_CREDS=crdentials('gcloud-creds')
    }
     stages {
        stage("Authenticate Gcloud") {
            steps {
		sh './test.sh'
                echo "Authenticate gcloud"
		withCredentials([file(credentialsId: 'gcloud-creds', variable: 'GCLOUD_CREDS')]) {
                bat 'gcloud auth activate-service-account --key-file=%GCLOUD_CREDS%'
                }
            }
        }
	stage("Set-up Management Plane") {
            steps{
                echo "Management Plane set-up"
		    sh './test.sh'
                sh './Create-Org-And-Env.sh'
                sh './Install-Apigee-Hybrid-Software.sh'
                sh './Create-Service-Account.sh'
                sh './Generate-TLS-Certificate.sh'
                sh './Configure-Cluster-ManagementPlane.sh'
		sh './Install-Apigee-Hybrid-Runtime.sh'
		echo "Installation completed"
            }
        }
     }
}
