#!/bin/bash
nvidia-docker-compose build
nvidia-docker-compose run \
	      -v $(pwd)/../skynet-data/data:/data \
	      train \
	        --sync s3://skynet-dbdean/output \
	        --iterations 30000 \
	        --snapshot 10000

