#! /bin/sh

echo "Total number of packets sent: "
grep -c "^[rd].*" wirelessnet.tr

echo "Number of packets received: "
grep -c "^r.*" wirelessnet.tr

echo "Number of packets dropped: "
grep -c "^d.*" wirelessnet.tr
