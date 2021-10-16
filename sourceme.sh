#!/bin/bash

CONTAINER_NAME=gtkdialog_ctx
if ! [[  $(docker image ls) =~ $CONTAINER_NAME ]]; then
	CTX_SRC_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
	docker build -t $CONTAINER_NAME -f $CTX_SRC_DIR/Dockerfile .
fi


dkx() {
	## 1st arg MUST be localhost source dir to mount
	## 2nd arg MUST be container dest path to mount source dir at
	if ! [[ ${#@} -gt 2 ]]; then
		echo "USAGE: dkx [sourcedir] [ctx_dest_mount_path] [all_remain_args_cmd_to_exec]"
	else
		SOURCE=$1
		DEST=$2
		CMDSTR="${@:3}"
	    export XSOCK=/tmp/.X11-unix
	    export XAUTH=/tmp/.docker.xauth

	    if [ ! -f $XAUTH ]; then
	        touch $XAUTH
	        xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge -
	    fi

	    docker run -i -t -e DISPLAY -e USER -e XAUTHORITY=$XAUTH \
			-v $XSOCK:$XSOCK -v $XAUTH:$XAUTH --net=host --workdir=${DEST} \
			--mount type=bind,source=${SOURCE},target=${DEST} $CONTAINER_NAME $CMDSTR
	fi
}
