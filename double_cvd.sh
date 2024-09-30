set -x

echo "**********************************************"
echo "RUN 0"
date
time ../run_cvd.sh
mv perf.data perf.data.smp_$SMP.run0
echo "**********************************************"
echo "RUN 1"
date
time ../run_cvd.sh
mv perf.data perf.data.smp_$SMP.run1
