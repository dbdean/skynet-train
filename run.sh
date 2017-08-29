#!/bin/bash
nvidia-docker build -t skynet-train:gpu -f docker/skynet-train/Dockerfile.gpu .
nvidia-docker run \
	      -v $(pwd)/../skynet-data/data:/data \
	      -v $(pwd)/output:/output \
	      --env-file docker.env \
	      skynet-train:gpu \
	        --sync s3://skynet-dbdean/output \
	        --iterations 10000 \
	        --snapshot 10000

