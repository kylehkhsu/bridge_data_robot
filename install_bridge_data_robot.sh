PROJECT_PATH="/iris/u/kylehsu/code/Real2Sim/bridge_data_robot"
cd ${PROJECT_PATH}

SETUP_SCRIPT_PATH="${PROJECT_PATH}/setup_bridge_data_robot.sh"
WORKSPACE_BASE_PATH="${PROJECT_PATH}/workspaces"
INTERBOTIX_WS=${WORKSPACE_BASE_PATH}/interbotix_ws

export PYTHONPATH="${PYTHONPATH}:${INTERBOTIX_WS}/src/interbotix_ros_toolboxes/interbotix_xs_toolbox"
source /opt/ros/noetic/setup.bash
source ${INTERBOTIX_WS}/devel/setup.bash
source /home/kylehsu/miniconda3/bin/activate
conda create -n real_wx250s python=3.10
conda activate real_wx250s
pip install -r ${PROJECT_PATH}/widowx_envs/requirements.txt

export PYTHONPATH="${PYTHONPATH}:${INTERBOTIX_WS}/src/widowx_envs"

## needed?
#ENV ROBONETV2_ARM=wx250s
#ENV DATA=/home/robonet/trainingdata
#ENV EXP=/home/robonet/experiments
#ENV REALSENSE_SERIAL=920312072629

source /opt/ros/noetic/setup.bash
source ${INTERBOTIX_WS}/devel/setup.bash
cd ${INTERBOTIX_WS}
catkin_make
touch ${PROJECT_PATH}/.built

cd ${PROJECT_PATH}
git clone https://github.com/youliangtan/edgeml
cd edgeml
pip install -e .