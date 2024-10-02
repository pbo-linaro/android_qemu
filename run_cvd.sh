set -x
trap "pkill qemu-system; pkill run_cvd" EXIT

echo parallelism: $SMP

HOME=$(pwd) ./bin/launch_cvd -vm_manager qemu_cli -report_anonymous_usage_stats=n --start_webrtc=false -qemu_binary_dir=$(pwd)/.. &
sleep 15
timeout 60m tail -f -n+0 cuttlefish/instances/cvd-1/logs/kernel.log |& grep -q VIRTUAL_DEVICE_BOOT_STARTED
pkill qemu-system
sleep 1
pkill run_cvd
sleep 1
