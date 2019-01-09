#!/usr/bin/env bash
# Example:
#    ./find-ecr-image.sh foo/bar mytag

if [[ $# -lt 2 ]]; then
    echo "Usage: $( basename $0 ) <repository-name> <image-tag>"
    exit 1
fi

IMAGE_META="$( aws ecr describe-images --repository-name=$1 --image-ids=imageTag=$2 2> /dev/null )"

if [[ $? == 0 ]]; then
    IMAGE_TAGS="$( echo ${IMAGE_META} | jq '.imageDetails[0].imageTags[0]' -r )"
    echo "Found Repo on ECR: $1:$2"
    echo "Did you remember to increment package.json?"
    exit 1
else
    echo "$1:$2 not found on ECR. Continuing build..."
fi