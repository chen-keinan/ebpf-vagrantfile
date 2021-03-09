# ebpf-vagrantfile

vagrant file to be used for ebpf program developments include :
- bpf tools 
- golang tools
- dlv for remote debug

## Quick Start

Execute kube-eacon without any flags , execute all tests 
```
 git clone git@github.com:chen-keinan/ebpf-vagrantfile.git
 cd ebpf-vagrantfile
 vagrant up

```


### Compile binary with debug params
```
GOOS=linux GOARCH=amd64 go build -v -gcflags='-N -l' demo.go
```
### Run debug on remote machine
```
dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec ./demo
```

### tear down
```
 vagrant destroy

```

