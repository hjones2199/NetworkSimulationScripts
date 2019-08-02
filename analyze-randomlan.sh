#! /bin/bash


# totals
echo "Total number of packets sent: "
grep -c "^[rd].*" out.tr

echo "Number of packets received: "
grep -c "^r.*" out.tr

echo "Number of packets dropped: "
grep -c "^d.*" out.tr

# first 6th
#echo ""
#split -n l/1/6 out.tr | grep -c "$"

#echo "last quarter of file receives:"
#split -n l/4/4 out.tr | grep -c "^r.*"
