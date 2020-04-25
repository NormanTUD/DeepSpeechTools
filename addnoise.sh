#!/bin/bash

cd $1

for INPUT in *.wav; do
    if [ ! -f "$INPUT.done" ]; then
        echo "Doing $INPUT"
        sox $INPUT -p synth whitenoise vol 0.02 | sox -m $INPUT - addednoise.wav;
        mv addednoise.wav $INPUT
        touch "$INPUT.done"
    else
        echo "$INPUT already done"
    fi
done

