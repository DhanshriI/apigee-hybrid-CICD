pipeline {
    agent any
    parameters {
        string(defaultValue: "Unit", description: 'Which environment you want to deploy?', name: 'Environment')
        choice(choices: ['Install', 'Upgrade','Rollback'], description: 'Action to perform?', name: 'Activity')
    }
    // environment {
    //     CLOUDSDK_CORE_PROJECT='';
    //     CLIENT_EMAIL=''
    //     GCLOUD_CREDS=crdentials('gcloud-creds')
    // }
    stages {
        stage("Authinticate Gcloud") {
            steps {
                echo "Authenticate gcloud"
		        withEnv(["PATH+GCLOUD=${tool 'Gcloud-SDK'}/bin"]) {
                //withCredentials([file(credenitialsId: 'gcloud-creds', variable: 'GCLOUD_CREDS')]){
                bat 'gcloud version'
                //bat 'gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"'
                }
                }
            }
        }
    //     stage("Set-up Management Plane") {
    //         steps{
    //             echo "Management Plane set-up"
    //             bat 'Create-Org-And-Env.bat'
    //             bat 'Install-Apigee-Hybrid-Software.bat'
    //             bat 'Create-Service-Account.bat'
    //             bat 'Generate-TLS-Certificate.bat'
    //             bat 'Configure-Cluster-ManagementPlane.bat'
                
    //         }
    //     }
    //      stage("Install Runtime Plane") {
    //         steps{
    //             echo "Install Runtime Plane"
    //             bat 'Install-Apigee-Hybrid-Runtime.bat'
    //         }
    //     }   
    // }
}
