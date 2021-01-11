#!/bin/bash

lecture_num=$1
course="352-S20"

make clean
make

cmd="scp *.html sn624@porthos.cs.rutgers.edu:/fac/users/sn624/public_html/${course}/"
echo $cmd
$cmd

cmd="scp lectures/${lecture_num}-* sn624@porthos.cs.rutgers.edu:/fac/users/sn624/public_html/${course}/lectures/"
echo $cmd
$cmd

cmd="ssh sn624@porthos.cs.rutgers.edu sh /fac/users/sn624/permissions-script.sh"
echo $cmd
$cmd
