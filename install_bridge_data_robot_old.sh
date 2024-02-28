#!/bin/bash
export ROS_DISTRO=noetic
export PROJECT_PATH=/iris/projects/sim_eval
export WORKSPACE_BASE_PATH="/iris/projects/sim_eval/workspaces"

# install interbotix packages
$PROJECT_PATH/scripts/install_interbotix.sh

# install python dependencies
source /opt/miniconda3/bin/activate
conda activate real_wx250s
pip install -r $PROJECT_PATH/bridge_data_robot/widowx_envs/requirements.txt

# build interbotix ros packages
ln -s $PROJECT_PATH/bridge_data_robot/widowx_envs $WORKSPACE_BASE_PATH/interbotix_ws/src/
cd $WORKSPACE_BASE_PATH/interbotix_ws
catkin_make
#touch ~/.built

# 2023-11-17: need to do conda install libffi==3.3 -y
# from https://github.com/conda/conda/issues/12287