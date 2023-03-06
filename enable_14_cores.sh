

core_reduce_start=$(lscpu | grep -i "off-line"| awk '{print $NF}' | awk -F'-' '{print $1}')
core_reduce_end=$(lscpu | grep -i "off-line"| awk '{print $NF}' | awk -F'-' '{print $2}')

echo "Cores enables from $core_reduce_start to $core_reduce_end"

function disable_cores() {
  start=$1
  end=$2
  for i in $(seq $start $end) ; do 
   echo 1 > "/sys/devices/system/cpu/cpu$i/online"
  done
}

disable_cores $core_reduce_start $core_reduce_end

