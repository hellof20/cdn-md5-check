# cdn-md5-check
执行cdn缓存失效后，从全球发起访问这个文件，从而检查失效操作是否已成功.

# Principle
- 在Google Cloud全球各个区域部署Cloud Function, 运行检查的时候会并行调用这些Cloud Function的endpoint。
- Cloud Function会下载指定文件，计算MD5，然后和用户指定的MD5比对是否匹配。

# Deploy(Optional)
```
for i in us-west1 us-west2 us-west3 us-west4 us-central1 us-east1 us-east4 us-east5 us-south1 northamerica-northeast1 northamerica-northeast2 southamerica-west1 southamerica-east1 europe-west2 europe-west1 europe-west4 europe-west6 europe-west3 europe-north1 europe-central2 europe-west8 europe-southwest1 europe-west9 europe-west12 europe-west10 asia-south1 asia-south2 asia-southeast1 asia-southeast2 asia-east2 asia-east1 asia-northeast1 asia-northeast2 asia-northeast3 me-west1 me-central1 me-central2 australia-southeast1;do
  gcloud functions deploy md5_check --trigger-http --gen2 --allow-unauthenticated --runtime python310 --source=. --region $i;
done
```

# Usage
```
bash md5-check.sh 文件cdn地址 期望的md5值
```
Example: 
```
bash md5-check.sh http://34.126.228.45/a.txt c736272c706c60d5a126deb00148cd23
```

# Result
![img_v3_028o_a1ac80d7-7247-412b-9be7-251b5cbf0c5g](https://github.com/hellof20/cdn-md5-check/assets/8756642/75041aa7-7029-4235-ba9d-6991b0e1d07c)
