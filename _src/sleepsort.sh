#!/bin/bash
function f() {
echo \<"$1"\>
sleep "$1"
echo "$1"
}
while [ -n "$1" ]
do
f "$1" &
shift
done
wait