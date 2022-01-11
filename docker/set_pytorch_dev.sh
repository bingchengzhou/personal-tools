export DEBUG
export REL_WITH_DEB_INFO 
export BUILD_TEST=0
export USE_CUDA=0
export MAX_JOBS=16 
export USE_FBGEMM=0
export MTDNN_ROOT=/home/workspace/mtDNN
export MTDNN_PLATFORM_NAME="NVIDIA CUDA"
mkdir -p /etc/OpenCL/vendors
echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

