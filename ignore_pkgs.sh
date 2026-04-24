#!/bin/bash

echo -e "\e[1;92mIgnoring all packages in robotiq/\n\e[0m"

echo "Clearing existing CATKIN_IGNORE files"

for dir in robotiq/*/
do
	dir=${dir%/}  # Remove trailing slash
	rm -f "$dir/CATKIN_IGNORE"
done

for pkg in $(echo "
	robotiq_2f_140_gripper_visualization
	robotiq_3f_gripper_articulated_msgs
	robotiq_3f_gripper_control
	robotiq_3f_gripper_joint_state_publisher
	robotiq_3f_gripper_msgs
	robotiq_3f_gripper_visualization
	robotiq_ethercat
	robotiq_ft_sensor
	robotiq_modbus_tcp
	")
do
	echo "Ignoring: $pkg"
	touch robotiq/$pkg/CATKIN_IGNORE
done

