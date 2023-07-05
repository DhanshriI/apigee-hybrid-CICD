echo @off

echo Download a script to create the overrides.yaml file
gsutil cp gs://cloud-training/CBL466/create_overrides.sh ~
chmod a+x ~/create_overrides.sh

echo Run the script to create the overrides-test.yaml file
~/create_overrides.sh test test-group us-central1

echo Verify file Content
cat ~/apigee/hybrid-files/overrides/overrides-test.yaml

echo Management Plane Configuration

echo Enable Synchronizer access
export TOKEN=$(gcloud auth print-access-token)
curl -X POST -H "Authorization: Bearer ${TOKEN}" -H "Content-Type:application/json" "https://apigee.googleapis.com/v1/organizations/${ORG}:setSyncAuthorization" -d '{"identities":["serviceAccount:apigee-synchronizer@'${PROJECT_ID}'.iam.gserviceaccount.com"]}'
