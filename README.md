# [oisa](https://github.com/cwfletcher/oisa.git) fix scripts for Ubuntu 20.04 LTS
## Ubuntu packages needed:
```bash
$ sudo apt-get install git autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config
```
```bash
export RISCV=/path/to/install/riscv/toolchain
export PATH=$RISCV/bin:$PATH
```
## Clone this repository
```bash
$ git clone https://github.com/yanjingpo/oisa_fix_script.git
```
## Run script 
```bash
$ cd oisa_fix_script
$ ./clone_oisa.sh
$ ./download_init_submodules.sh
$ ./build_install_tools.sh
$ ./verisim_make.sh
```
##  Other useage can get it by [here](https://github.com/cwfletcher/oisa#2-compile-a-program-into-riscv-binary-using-oisa-primitives-run-with-sw-simulator-spike)
