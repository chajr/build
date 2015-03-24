#!/usr/bin/env bash
echo '';
echo 'Build started';
echo '';

ENVIRONMENTS_LIST=`ls environments/`;
BASE_DIR=`pwd`;

for file in $ENVIRONMENTS_LIST
do
    if [ 'example.sh.dist' == $file ]
    then
        continue
    fi

    echo "Executing configuration from: $file";
    . environments/$file;

    if [ $HOST ]
    then
        echo "Connecting with remote host: $HOST";
        ssh $HOST;
    else
        cd $DIR;
    fi

    cd $BASE_DIR;
    echo '';
done

echo 'Build finished';
echo '';
