#!/bin/bash

course="352-S20"

make clean
make

cmd="scp *.html sn624@porthos.cs.rutgers.edu:/fac/users/sn624/public_html/${course}/"
echo $cmd
$cmd
