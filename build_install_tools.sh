#!/bin/bash
#(cd oisa/Pre-NDSS && ./scripts/build-tools.sh)

echo "cd oisa/Pre-NDSS/rocket-chip/riscv-tools"
cd oisa/Pre-NDSS/rocket-chip/riscv-tools
# We need to build a RV64G toolchain (not RVC which is the current riscv-tools default).
# Therefore, let's make our own build script and then invoke it.
f=build-rv64g.sh

if [[ ! -e "$f" ]]
then
	# If file doesn't exist, generate a new build script file.
	echo "Generating script: rocket-chip/riscv-tools/$f"
	echo "#! /bin/bash" >> $f
	echo "#" >> $f
	echo "# Script to build RISC-V ISA simulator, proxy kernel, and GNU toolchain." >> $f
	echo "# Tools will be installed to \$RISCV." >> $f
	echo "" >> $f
	echo ". build.common" >> $f
	echo "" >> $f
	echo "echo "Starting RISC-V Toolchain build process"" >> $f
	echo "echo "Tools will be installed to \$RISCV."" >> $f
	echo "" >> $f
	echo "build_project riscv-fesvr --prefix=\$RISCV" >> $f
	echo "build_project riscv-isa-sim --prefix=\$RISCV --with-fesvr=\$RISCV --with-isa=rv64imafd" >> $f
	echo "build_project riscv-gnu-toolchain --prefix=\$RISCV --with-arch=rv64imafd" >> $f
	echo "CC= CXX= build_project riscv-pk --prefix=\$RISCV --host=riscv64-unknown-elf" >> $f
	echo "build_project riscv-openocd --prefix=\$RISCV --enable-remote-bitbang --enable-jtag_vpi --disable-werror" >> $f
	echo "build_project riscv-tests --prefix=\$RISCV/riscv64-unknown-elf" >> $f
	echo "" >> $f
	echo "echo \"RISC-V Toolchain installation completed!\"" >> $f
else
	echo "Using existing $f script."
fi

chmod a+x $f && echo "./$f" && ./$f
retVal=$?
if [ ! $retVal -eq 0 ]; then
    echo "A error has been encountered while building the toolchain."
fi
exit $retVal
