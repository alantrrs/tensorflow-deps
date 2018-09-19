docker build -t tf-lambda-pack .
docker run -ti -v $(pwd)/tf-pack:/home/lambdapack --rm --entrypoint /bin/sh tf-lambda-pack /home/buildPack.sh
