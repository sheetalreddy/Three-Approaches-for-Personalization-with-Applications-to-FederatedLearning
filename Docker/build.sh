#!/bin/bash
# File              : build.sh
# Author            : Sheetal Reddy <sheetal.reddy@ai.se>
# Date              : 30.03.2021
# Last Modified Date: 30.03.2021
# Last Modified By  : Sheetal Reddy <sheetal.reddy@ai.se>


docker build   --build-arg u_id=$(id -u) --build-arg g_id=$(id -g) --build-arg username=$(id -gn $USER)  -f Dockerfile -t custom_docker_image_tff ..
