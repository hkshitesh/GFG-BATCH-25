aws eks --region ap-south-1 describe-cluster --name hksCluster --query cluster.status

## 
aws eks --region ap-south-1 update-kubeconfig --name hksCluster

##
arn:aws:s3:::hks-metaflow-bucket
