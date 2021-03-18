#!/bin/bash

echo "Provisioning virtual machine..."

echo "install bpf dependencies packages i.e(clang llvm and etc)"
sudo yum install -y clang elfutils-libelf-devel gcc git llvm make zlib > /dev/null

echo "download bpf helper"
curl -LO https://raw.githubusercontent.com/torvalds/linux/v4.18/tools/testing/selftests/bpf/bpf_helpers.h

echo "install python 3"
sudo yum install -y python3

echo "download kernal-5.6"
curl -LO --insecure https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.6.tar.xz

echo "install kernal headers"
yum install -y kernel-devel


echo "extract files"
tar xf linux-5.6.tar.xz
cd linux-5.6/
cp tools/lib/bpf/bpf_helpers.h /vagrant/
./scripts/bpf_helpers_doc.py --header --file tools/include/uapi/linux/bpf.h > /vagrant/bpf_helper_defs.h

echo "clone libbpf repsitory"
git clone https://github.com/libbpf/libbpf
cd libbpf/src/
make
sudo make install
cp bpf_helper{,_def}s.h /vagrant/

echo "install golang pkg"
sudo yum install -y golang 

echo "Install dlv pkg"
 git clone https://github.com/go-delve/delve.git $GOPATH/src/github.com/go-delve/delve
 cd $GOPATH/src/github.com/go-delve/delve
 make install

### export dlv bin path
echo export PATH=$PATH:/home/vagrant/go/bin >> ~/.bashrc
echo export PATH=$PATH:/root/go/bin >> ~/.bashrc

echo "Finished provisioning."
