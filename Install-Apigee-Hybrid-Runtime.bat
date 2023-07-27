echo @off

echo Install the gke-cloud-auth-plugin
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
gcloud container clusters get-credentials apigee-hybrid

echo Initialize the cluster with system components
cd ~/apigee/hybrid-files

::Perform a "dry run" (test run) of the cluster initialization to check for errors
$APIGEECTL_HOME/apigeectl init -f overrides/overrides-test.yaml --dry-run=client

::Initialize installation
$APIGEECTL_HOME/apigeectl init -f overrides/overrides-test.yaml
timeout /t 600 /nobreak

echo Verify that the cluster is ready with all components running
$APIGEECTL_HOME/apigeectl check-ready -f overrides/overrides-test.yaml

echo View the status of the hybrid system pods in the apigee-system and istio-system namespaces, 
kubectl get pods -n apigee-system

kubectl get pods -n istio-system

echo Install the hybrid workloads into the cluster
$APIGEECTL_HOME/apigeectl apply -f overrides/overrides-test.yaml --dry-run=client
$APIGEECTL_HOME/apigeectl apply -f overrides/overrides-test.yaml
timeout /t 600 /nobreak

$APIGEECTL_HOME/apigeectl check-ready -f overrides/overrides-test.yaml

::Check pods status
kubectl get pods -n apigee


