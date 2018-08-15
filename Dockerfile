FROM ros:indigo

MAINTAINER iory ab.ioryz@gmail.com

ENV ROS_DISTRO indigo

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    ros-${ROS_DISTRO}-jsk-tools \
    ros-${ROS_DISTRO}-jsk-perception && \
    rm -rf /var/lib/apt/lists/*

RUN touch /root/.bashrc && \
    echo "source /opt/ros/indigo/setup.bash\n" >> /root/.bashrc && \
    echo "rossetip\n" >> /root/.bashrc && \
    echo "rossetmaster localhost\n"

COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
