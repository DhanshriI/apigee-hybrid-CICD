@echo off

echo Creating Hybrid Org
cd ~

echo %GOOGLE_CLOUD_PROJECT%
gcloud config set project qwiklabs-gcp-04-74922148a738
./provision_hybrid_org.sh -o qwiklabs-gcp-04-74922148a738 -r us-central1
timeout /t 300 /nobreak

echo Configure env variables
source ~/apigee-env-test.sh us-east1 us-east1-d
echo $PROJECT_ID
echo $GCP_REGION
echo $GCP_ZONE
echo $ORG
echo $ENV
echo $ENV_GROUP
echo $INGRESS_DN

echo Hybrid Environment
set TOKEN=$(gcloud auth print-access-token)
curl -X POST -H "Authorization: Bearer ${TOKEN}" -H "Content-Type:application/json"  "https://apigee.googleapis.com/v1/organizations/$ORG/envgroups"  -d '{"name": "'"$ENV_GROUP"'", "hostnames":["'"$INGRESS_DN"'"]}'
curl -X POST -H "Authorization: Bearer ${TOKEN}" -H "Content-Type:application/json"  "https://apigee.googleapis.com/v1/organizations/$ORG/envgroups/$ENV_GROUP/attachments" -d '{"environment": "'"$ENV"'"}'

echo Authenticate apigee cluster
gcloud container clusters get-credentials apigee-hybrid
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
echo; echo "gcloud container clusters get-credentials apigee-hybrid" >> ~/.profile

