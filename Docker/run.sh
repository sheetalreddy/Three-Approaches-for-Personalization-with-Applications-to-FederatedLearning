#!/bin/bash
# File              : run.sh
# Author            : Sheetal Reddy <sheetal.reddy@ai.se>
# Date              : 30.03.2021
# Last Modified Date: 30.03.2021
# Last Modified By  : Sheetal Reddy <sheetal.reddy@ai.se>
ROOT_DIR=$PWD/..
DATA_DIR=$ROOT_DIR/src

nvidia-docker run  -v $DATA_DIR:/src -p 8889:8889 -it custom_docker_image_tff  bash
