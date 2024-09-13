FROM_PREFIX=$1
TO_PERFIX=$1

#1.30.1
DOCKER_IMAGES=(
louislam/uptime-kuma:1
)

set -x



for name in "${DOCKER_IMAGES[@]}"; do
    echo $name
    asset="${name}"
    docker pull "$FROM_PREFIX/$asset"
    docker tag $FROM_PREFIX/$asset $TO_PERFIX/$asset 
    docker push $TO_PERFIX/$asset  
done
