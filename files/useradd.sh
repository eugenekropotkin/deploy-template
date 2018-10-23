#!/bin/bash

for i in $(cat useradd.txt)
do
    pwd1=$(pwgen -n -A 8 1)
    #pwd1="342516"
    pwgen=$(echo "python2 -c 'import crypt, os,base64; print crypt.crypt(\"$pwd1\", \"\$6\$\"+base64.b64encode(os.urandom(16))+\"\$\")'  $pwd1")
    echo "pwgen="$pwgen
    respw=$(eval $pwgen)
    hash=$(echo "'"$respw"'")
    cmd="useradd t$i -p $hash -s /bin/false -g 13"
    echo "cmd="$cmd"    ////pw="$pwd1
    eval $cmd && echo "pwdsms== "$i" t"$i" "$pwd1
done
