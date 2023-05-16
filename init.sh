#!/bin/bash
curl https://get.docker.com/ | sh
docker run -p 6333:6333 "qdrant/qdrant" 