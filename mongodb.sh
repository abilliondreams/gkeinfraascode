CONTAINER_CLUSTER='deploy-service-cluster'
GCLOUD_PROJECT='gke-project-id'
CLOUDSDK_COMPUTE_ZONE='us-central1'


curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh


echo "Get Kubernetes credentials for $CONTAINER_CLUSTER in project $GCLOUD_PROJECT and zone $CLOUDSDK_COMPUTE_ZONE"
gcloud container clusters get-credentials $CONTAINER_CLUSTER --project=$GCLOUD_PROJECT --zone=$CLOUDSDK_COMPUTE_ZONE

#kubectl apply -f helm-init.yaml

helm init --wait

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/mongodb