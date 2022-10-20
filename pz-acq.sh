#!/bin/bash
#this script is to change the pole zero value and the comment for the run
#then sleep (so the pole zero can update) 
#then take the run, wait for it to finish and then restart

arr=(55.1 55.2 55.3 55.4 55.5 55.6 55.7 55.8 55.9 56)
 
for item in "${arr[@]}"; do
    echo " ${item}"
    cp pz.odb pz_tmp.odb
    sed -i "s/53/${item}/g" pz_tmp.odb

    more pz_tmp.odb

    odbedit -h grsmid02 -e tigdaq -c 'load pz_tmp.odb'


    sleep 4m
    odbedit -h grsmid02 -e tigdaq -c start
    sleep 180

    echo "${item}"

    rm pz_tmp.odb
    
done


