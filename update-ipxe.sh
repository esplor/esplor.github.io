#!/usr/bin/env sh
clear
echo updating submodules

#Did not work: git submodule update --init --recursive

git submodule update --recursive --remote
cd ipxe/src/

echo Make clean \(very\)...
make veryclean

echo Making undionly, iso and x64 efi with embedded script.
make bin/undionly.kpxe EMBED=../../esplor.github.io.boot.ipxe
make bin/ipxe.iso EMBED=../../esplor.github.io.boot.ipxe
make bin-x86_64-efi/ipxe.efi EMBED=../../esplor.github.io.boot.ipxe

echo Moving undionly.kpxe to root dir
mv bin/undionly.kpxe ../../undionly.kpxe

echo Moving ipxe.iso to root dir
mv bin/ipxe.iso ../../ipxe.iso

echo Moving 64 bit ipxe.efi to ipxe64.efi root dir
mv bin-x86_64-efi/ipxe.efi ../../ipxe64.efi

# Do we need this
cd ../..