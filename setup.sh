#!/bin/bash

echo "This is an edited setup.sh."

echo "AIcrowd installer starting..."

if ! nvidia-smi > /dev/null 2>&1; then
  echo "🚫 No GPU runtime detected..."
  echo "Please update the runtime by going to Runtime -> Change Runtime Type -> Hardware Accelerator -> GPU"
  exit 1
fi

echo "Setting up the environment for you!"

echo "⚙️ Installing PyTorch..."
pip install -U torch==1.5 torchvision==0.6 -f https://download.pytorch.org/whl/cu101/torch_stable.html > /dev/null

echo "⚙️ Installing COCO API..."
pip install cython pyyaml==5.1 > /dev/null
pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI' > /dev/null

echo "⚙️ Installing detectron..."
pip install detectron2==0.1.2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu101/index.html > /dev/null


#Datasets (This gets downloaded in "/content/foodChallenge/data")
echo "🗄 Preparing the datasets..."
wget -q -nv https://drive.google.com/drive/folders/1fAd8g41CXbbm5DYI1SUZ3rwoZIYpK9hp
#unzip -q -d set train-v0.4.tar.gz

#echo "🗄 Preparing the validation dataset..."
#wget -q -nv https://drive.google.com/file/d/1EMMjJ4FfnS8U9mRXahhEoSZs4mU13HS3/view?usp=sharing
#unzip -q -d set val-v0.4.tar.gz

echo "Installing 7-Zip..."
echo " "
apt install p7zip-full
echo " "
echo "All set! 🎉🍻"
