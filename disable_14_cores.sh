core_reduce=2
num_of_cores="$(nproc)"
if [[ $num_of_cores -ge 4 ]] ; then
	echo "Number of cores greater than 4"
else
	echo "Number of core less than 4"
	core_reduce=1
fi

echo "Cores will be reduced to $core_reduce"

function disable_cores() {
  start=$1
  end=$2
  for i in $(seq $start $(($end-1)) ); do 
   echo 0 > "/sys/devices/system/cpu/cpu$i/online"
  done
}

disable_cores $core_reduce $num_of_cores

