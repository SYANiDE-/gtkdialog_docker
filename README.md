# gtkdialog_docker
Docker image containing gtkdialog, for quick gtkdialog prototyping

Build/Install:
    source sourceme.sh

By sourcing the sourceme.sh, a function 'dkx' is made available on your current bash session.  This function starts the container, mounting a source directory on your container host as destination directory in your container, then sets the working directory to that dest directory.  The gtkdialog will run over X forwarding on your container host.

USAGE:
     dkx [sourcedir] [ctx_dest_mount_path] [all_remain_args_cmd_to_exec]


EXAMPLE:
	dkx ~/ETBD/11_Kiosk_Breakouts/ /opt/scripts/ gtkdialog -f 11.3.1__01__gtkdialog_pseudoterminal

![alt text](https://github.com/SYANiDE-/gtkdialog_docker/blob/master/2021-10-16_16-40.png?raw=true)
