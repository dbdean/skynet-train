#!/bin/bash
nvidia-docker-compose build
nvidia-docker-compose run \
	      -v $(pwd)/../skynet-data/data:/data \
	      train \
	        --sync s3://skynet-dbdean/output/road_building \
	        --iterations 50000 \
	        --snapshot 10000

