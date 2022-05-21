#!/bin/bash

rm bin/*.bin

rm bin/TurnScreenWhite

nasm RunSecondSector.asm -f bin -o RunSecondSector.bin

mv RunSecondSector.bin bin

nasm SecondSector.asm -f bin -o SecondSector.bin

mv SecondSector.bin bin

cd bin

cat RunSecondSector.bin SecondSector.bin > TurnScreenWhite
