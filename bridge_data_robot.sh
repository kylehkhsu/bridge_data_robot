#!/bin/bash
export ROS_DISTRO=noetic
export PROJECT_PATH=/iris/projects/sim_eval
export WORKSPACE_BASE_PATH="/iris/projects/sim_eval/workspaces"

# install interbotix_ros_arms repo, i.e. 'https://raw.githubusercontent.com/Interbotix/interbotix_ros_manipulators/834edcbe6b955497d10ebc20ea9242c3f61e8fd1/interbotix_ros_xsarms/install/amd64/xsarm_amd64_install.sh'
source /opt/ros/$ROS_DISTRO/setup.bash
source /iris/projects/sim_eval/workspaces/realsense_ws/devel/setup.bash
source /iris/projects/sim_eval/workspaces/apriltag_ws/devel_isolated/setup.bash
source /iris/projects/sim_eval/workspaces/interbotix_ws/devel/setup.bash
export ROS_IP=$(echo `hostname -I | cut -d" " -f1`)
if [ -z "$ROS_IP" ]; then
	export ROS_IP=127.0.0.1
fi
export PYTHONPATH="${PYTHONPATH}:$WORKSPACE_BASE_PATH/interbotix_ws/src/interbotix_ros_toolboxes/interbotix_xs_toolbox"

# add widowx_envs code for build step
export PYTHONPATH="${PYTHONPATH}:$WORKSPACE_BASE_PATH/bridge_data_robot/widowx_envs"

export ROBONETV2_ARM=wx250s
#export DATA=/home/robonet/trainingdata
#export EXP=/home/robonet/experiments
#export REALSENSE_SERIAL=920312072629

source /opt/miniconda3/bin/activate
conda activate real_wx250s
cd $PROJECT_PATH
