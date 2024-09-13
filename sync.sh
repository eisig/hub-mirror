FROM_PREFIX=$1
TO_PERFIX=$2

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
    to_asset=$(echo "$asset" | sed 's/\//--/g')
    docker push $TO_PERFIX/$to_asset  
done
