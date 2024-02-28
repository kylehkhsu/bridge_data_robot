PROJECT_PATH="/iris/u/kylehsu/code/Real2Sim/bridge_data_robot"
cd ${PROJECT_PATH}

SETUP_SCRIPT_PATH="${PROJECT_PATH}/setup_bridge_data_robot.sh"
WORKSPACE_BASE_PATH="${PROJECT_PATH}/workspaces"
INTERBOTIX_WS=${WORKSPACE_BASE_PATH}/interbotix_ws

source /home/kylehsu/miniconda3/bin/activate
conda activate real_wx250s

source /opt/ros/noetic/setup.bash
source /iris/u/kylehsu/code/Real2Sim/bridge_data_robot/workspaces/interbotix_ws/devel/setup.bash
export ROS_IP=$(echo `hostname -I | cut -d" " -f1`)
if [ -z "$ROS_IP" ]; then
	export ROS_IP=127.0.0.1
fi

export PYTHONPATH="${PYTHONPATH}:${INTERBOTIX_WS}/src/widowx_envs"
export PYTHONPATH="${PYTHONPATH}:${INTERBOTIX_WS}/src/interbotix_ros_toolboxes/interbotix_xs_toolbox"
export ROBONETV2_ARM=wx250s
