#!/bin/bash

# # 设置Anaconda安装文件名
# ANACONDA_VERSION=2024.06-1
# ANACONDA_INSTALLER=Anaconda3-$ANACONDA_VERSION-Linux-x86_64.sh

# # 下载Anaconda到当前目录
# echo "正在下载Anaconda..."
# curl -O https://repo.anaconda.com/archive/$ANACONDA_INSTALLER

# # 安装Anaconda（这里假设自动接受许可协议并进行静默安装）
# echo "正在安装Anaconda..."
# bash $ANACONDA_INSTALLER -b -p $HOME/anaconda3

# # 初始化 conda
# echo "初始化 Conda..."
# source $HOME/anaconda3/bin/activate
# conda init

# # 创建名为py310的Conda环境，使用Python 3.10版本
# echo "创建Conda环境 py310，Python版本为3.10..."
# conda create -n py310 python=3.10 -y

# # 激活环境 py310
# echo "激活Conda环境 py310..."
# conda activate py310

# # 安装 PyTorch 适配 Python 3.10 和 CUDA 12.2
# echo "安装PyTorch（CUDA 12.2版本）..."
# conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

# # 安装 tqdm 和 scikit-learn
# echo "安装 tqdm 和 scikit-learn..."
# conda install tqdm scikit-learn -y

# 确保已安装 zsh
echo "检查并安装 zsh..."
if ! command -v zsh &> /dev/null
then
    echo "未检测到 zsh，正在安装 zsh..."
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update && sudo apt-get install zsh -y
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install zsh -y
    elif [ -x "$(command -v brew)" ]; then
        brew install zsh
    else
        echo "无法自动安装 zsh，请手动安装 zsh。"
        exit 1
    fi
fi

# 安装 oh-my-zsh
echo "正在安装 oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "完成！"
