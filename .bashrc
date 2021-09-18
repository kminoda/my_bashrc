# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Original .bashrc
source /etc/skel/.bashrc

# Add user's private bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# ROS
if [ -d "/opt/ros" ]; then
    source /opt/ros/melodic/setup.bash
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
    export ROSCONSOLE_FORMAT='[${severity}] [${time}] [${node}]: ${message}'
fi

# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Snap
export PATH="/snap/bin:$PATH"

# Linuxbrew
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Open tmux
if [[ ! -n $TMUX ]]; then
	tmux new-session
fi

if [[ ! -n $TMUX ]]; then
	tmux new-session && exit
fi

if [ -z "$FISH_VERSION" ]; then
    command -v fish > /dev/null 2>&1 && exec fish
fi
