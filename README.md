# gtkdialog_docker
Docker image containing gtkdialog, for quick gtkdialog prototyping

Build/Install:
> source sourceme.sh

By sourcing the sourceme.sh, the container image defined as CTX_CONTAINER_IMG will be built if not already.  A function 'dkx' is made available on your current bash session.  This function starts the container, mounting a source directory on your container host as destination directory in your container, then sets the working directory to that dest directory.  The gtkdialog will run over X on your container host.

USAGE:
> dkx [sourcedir] [ctx_dest_mount_path] [all_remain_args_cmd_to_exec]


EXAMPLE:
> dkx ~/ETBD/11_Kiosk_Breakouts/ /opt/scripts/ gtkdialog -f 11.3.1__01__gtkdialog_pseudoterminal


![alt text](https://github.com/SYANiDE-/gtkdialog_docker/blob/master/img/2021-10-16_16-40.png)

Note that the dest directory is the working directory, and all commands passed to the container are executed within the context of the container.  File read/write occurs within the container, discarded when the container is stopped.  In this way, you can develop your script on Kali, and display on Kali, but all execution context is within the container.

For a hat-trick, try passing the additional -d switch to gtkdialog to get verbose error output.
