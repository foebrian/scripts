#!/bin/bash

#USERNAME= echo "$USER"
HOSTS="%list_of_hosts%"
SCRIPT="sudo ifup eth1 && sudo chef-client && sudo ifdown"
SCRIPT2="ip link show eth1"

for HOSTNAME in ${HOSTS} ; do
	echo "Updating hosts, please wait.."
    ssh -l -o StrictHostKeyChecking=no ${HOSTNAME} "${SCRIPT}"
    
	echo "All hosts have been updated."   
	
	sleep 6 
    
done

for HOSTNAME in in ${HOSTS} ; do
    ssh -l -o StrictHostKeyChecking=no ${HOSTNAME} "${SCRIPT2}"
    
read -p "Please ensure all eth1 are in a 'DOWN' state."

done

exit 0
