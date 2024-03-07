#!/bin/bash

date
data='{"url":'\"$1\"',"md5":'\"$2\"'}'

for i in us-west1 us-west2 us-west3 us-west4 us-central1 us-east1 us-east4 us-east5 us-south1 northamerica-northeast1 northamerica-northeast2 southamerica-west1 southamerica-east1 europe-west2 europe-west1 europe-west4 europe-west6 europe-west3 europe-north1 europe-central2 europe-west8 europe-southwest1 europe-west9 europe-west12 europe-west10 asia-south1 asia-south2 asia-southeast1 asia-southeast2 asia-east2 asia-east1 asia-northeast1 asia-northeast2 asia-northeast3 me-west1 me-central1 australia-southeast1; do
  func_url=https://$i-speedy-victory-336109.cloudfunctions.net/md5_check
  curl --location $func_url --header 'Content-Type: application/json' --data $data -w '\n' &
done
wait
echo 'finished.'
