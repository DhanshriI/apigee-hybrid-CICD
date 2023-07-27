echo @off

cd ~/apigee/hybrid-files

echo Download a script from Cloud Storage to generate the certificate

gsutil cp gs://cloud-training/CBL466/gen_cert.sh ./certs
chmod a+x ./certs/gen_cert.sh

echo run the script
./certs/gen_cert.sh $ORG test

echo Inspect the details of the certificate
sudo openssl x509 -in ./certs/hybrid-cert.pem -text -noout | grep "DNS"

echo Verify that the certificate is valid
sudo openssl x509 -in ./certs/hybrid-cert.pem -text -noout | grep "Not"
timeout /t 120 /nobreak