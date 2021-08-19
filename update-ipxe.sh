#!/usr/bin/env sh

# Clear the screen
clear

echo updating submodules
git submodule init
git submodule update --recursive --remote

# Set relative location of the embedfile.
EMBEDFILE=../../esplor.github.io.boot.ipxe

cd ipxe/src/

echo Make clean \(very\)...
make veryclean

echo Making undionly, iso and i386 / x86_64 efi with embedded script.
make -j $(nproc) bin/undionly.kpxe 		EMBED=$EMBEDFILE
make -j $(nproc) bin/ipxe.iso 		EMBED=$EMBEDFILE
make -j $(nproc) bin-i386-efi/ipxe.efi 	EMBED=$EMBEDFILE
make -j $(nproc) bin-x86_64-efi/ipxe.efi 	EMBED=$EMBEDFILE

echo Moving undionly.kpxe to root dir
mv bin/undionly.kpxe ../../undionly.kpxe

echo Moving ipxe.iso to root dir
mv bin/ipxe.iso ../../ipxe.iso

echo Moving 32 bit ipxe.efi to ipxe32.efi root dir
mv bin-i386-efi/ipxe.efi ../../ipxe32.efi

echo Moving 64 bit ipxe.efi to ipxe64.efi root dir
mv bin-x86_64-efi/ipxe.efi ../../ipxe64.efi

# Do we need this
cd ../..
