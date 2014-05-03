#!/bin/bash -f

if [ "$1" != "" ]
then
    port=$1
else
    port=4000
fi

pushd ../area

# Set limits. (cannot be used in a 'sh' script - Loki)
# nohup
# nice
# limit stack 1024k
if [ -r shutdown.txt ]
then
    rm -f shutdown.txt
fi

while [ 1 ]
do
    # If you want to have logs in a different directory,
    #   change the 'logfile=' line to reflect the directory name.
    # (It isn't used but I let it in anyway)
    index=1000
    while [ 1 ]
    do
        logfile=../log/$index.log
        if [ -r $logfile ]
        then
            # If you don't have bc you have a problem... :(
            index=`echo $index + 1|bc`
        else
            break
        fi
    done

    # Update to new code if possible.
    if [ -r ../src/envy.new ]
    then
        \mv ../src/envy ../src/envy.old
        \mv ../src/envy.new ../src/envy
    fi

    ../src/envy $port >$logfile 2>&1

    if [ -r core ]
    then
        \mv core ../src/
    fi

    # Restart, giving old connections a chance to die.
    if [ -r shutdown.txt ]
    then
        rm -f shutdown.txt
        popd
        exit 0
    fi
    sleep 10
done
