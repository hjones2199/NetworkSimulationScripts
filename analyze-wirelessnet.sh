#! /bin/bash


# totals
echo "Total number of packets sent: "
grep -c "^[rd].*" wirelessnet.tr

echo "Number of packets received: "
grep -c "^r.*" wirelessnet.tr

echo "Number of packets dropped: "
grep -c "^d.*" wirelessnet.tr
echo

# first 6th
echo "Receives in the first 6th: "
split -n l/1/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the first 6th: "
split -n l/1/6 wirelessnet.tr | grep -c "^d.*"
echo

# second 6th
echo "Receives in the second 6th: "
split -n l/2/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the second 6th: "
split -n l/2/6 wirelessnet.tr | grep -c "^d.*"
echo

# third 6th
echo "Receives in the third 6th: "
split -n l/3/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the third 6th: "
split -n l/3/6 wirelessnet.tr | grep -c "^d.*"
echo

# fourth 6th
echo "Receives in the fourth 6th: "
split -n l/4/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the fourth 6th: "
split -n l/4/6 wirelessnet.tr | grep -c "^d.*"
echo

# fifth 6th
echo "Receives in the fifth 6th: "
split -n l/5/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the fifth 6th: "
split -n l/5/6 wirelessnet.tr | grep -c "^d.*"
echo

# sixth 6th
echo "Receives in the sixth 6th: "
split -n l/6/6 wirelessnet.tr | grep -c "^r.*"
echo "Drops in the sixth 6th: "
split -n l/6/6 wirelessnet.tr | grep -c "^d.*"



#echo "last quarter of file receives:"
#split -n l/4/4 wirelessnet.tr | grep -c "^r.*"
