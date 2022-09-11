# Docker for Deep Patch Visual Odometry
This repository produces a docker container for our paper:

[Deep Patch Visual Odometry](https://arxiv.org/pdf/2208.04726.pdf) [(Source Code)](https://github.com/princeton-vl/DPVO)<br/>
Zachary Teed, Lahav Lipson, Jia Deng<br/>

```
@article{teed2022deep,
  title={Deep Patch Visual Odometry},
  author={Teed, Zachary and Lipson, Lahav and Deng, Jia},
  journal={arXiv preprint arXiv:2208.04726},
  year={2022}
}
```


## Install Dependencies
You can install Docker [here](https://docs.docker.com/engine/install/)

Also add the [nvidia-docker](https://nvidia.github.io/nvidia-docker/) repository
```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
```
Install the Nvidia container/docker toolkits
```
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit nvidia-docker2
sudo systemctl restart docker
```

## Container Setup
Build the docker container

```
sudo ./build_container.sh <cuda-version>.1
```
_Example: If_ `nvidia-smi` _shows_ `CUDA Version: 11.6` _then run_ `sudo ./build_container.sh 11.6.1`

Start an interactive shell
```
sudo docker exec -it dpvo bash
```

Install DPVO and Pangolin
```
conda activate dpvo
./install_dpvo.sh
```

You should now be able to run DPVO
```
./download_models_and_data.sh
python demo.py --imagedir=movies/IMG_0494.MOV --calib=calib/iphone.txt --stride=5 --viz 
```
