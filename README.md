# ubuntu-cuda
Simple Docker container with CUDA

This is a simple automated docker build for a Ubuntu 16.04-based container with
CUDA libraries pre-installed and configured. Note that it requires nvidia-361
drivers to be installed on the host system.

Usage Note: To run this container, you must specify the paths to CUDA devices on
your system, like so:

```
sudo docker run -ti --device /dev/nvidia0:/dev/nvidia0 --device \
/dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm \
djpetti:ubuntu-cuda
```

You can pull it from here: djpetti:ubuntu-cuda
