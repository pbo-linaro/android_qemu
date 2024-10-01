set -x
set -euo pipefail

trap "pkill qemu-system; pkill run_cvd" EXIT

echo parallelism: $SMP

(HOME=$(pwd) ./bin/launch_cvd -vm_manager qemu_cli -report_anonymous_usage_stats=n --start_webrtc=false -qemu_binary_dir=$(pwd)/.. |& tee out.log)&
sleep 2
(timeout 120m tail -f -n+0 out.log  |& grep -q VIRTUAL_DEVICE_BOOT_STARTED) || true
pkill qemu-system || true
sleep 1
pkill run_cvd || true
sleep 1
