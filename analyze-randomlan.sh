#! /bin/sh

echo "Total number of packets sent: "
grep -c "^[rd].*" out.tr

echo "Number of packets received: "
grep -c "^r.*" out.tr

echo "Number of packets dropped: "
grep -c "^d.*" out.tr
