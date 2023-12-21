# Import Image into ACR
SOURCE_REGISTRY=$1 #docker.io
IMAGE_NAME=$2 #prefecthq/prefect:2.8.6-python3.11
DESTINATION_REGISTRY=$3 #crlander
az acr import \
  --name $ACRNAME \
  --source $SOURCE_REGISTRY/$IMAGE_NAME \
  --image $IMAGE_NAME
