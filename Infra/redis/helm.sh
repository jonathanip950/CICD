helm repo add bitnami https://charts.bitnami.com/bitnami
sudo helm install redis bitnami/redis --set architecture=standalone --set auth.password=admin --set master.persistence.existingClaim=redis-data --set volumePermissions.enabled=true -n redis
