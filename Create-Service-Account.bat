@echo off

echo Create new Service Account
cd ~/apigee/hybrid-files
./tools/create-service-account --env prod --dir ./service-accounts
timeout /t 120 /nobreak