#!/bin/sh
echo "Step 1 Login" >> log
docker login -u $DOCKER_USER -p $DOCKER_PASS >> log
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo "Step 2 Build" >> log
docker build -f Dockerfile -t $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG .  >> log
echo "Step 1 Push" >> log
docker push $DOCKER_USER/$TRAVIS_REPO_SLUG  >> log
