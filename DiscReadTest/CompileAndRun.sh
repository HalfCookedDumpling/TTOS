#!/bin/bash

nasm RunSecondSector.asm -f bin -o RunSecondSector.bin

nasm SecondSector.asm -f bin -o SecondSector.bin

cat RunSecondSector.bin SecondSector.bin > RunSecondSectorTest

qemu-system-x86_64 RunSecondSectorTest
