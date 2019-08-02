Phy/WirelessPhy set freq_ 2.472e9
Phy/WirelessPhy set RXThresh_ 2.62861e-09; #100m radius
Phy/WirelessPhy set CSThresh_ [expr 0.9*[Phy/WirelessPhy set RXThresh_]]
Phy/WirelessPhy set bandwidth_ 11.0e6
Mac/802_11 set dataRate_ 11Mb
Mac/802_11 set basicRate_ 2Mb

set val(chan) Channel/WirelessChannel ;
set val(prop) Propagation/TwoRayGround ;
set val(netif) Phy/WirelessPhy ;
set val(mac) Mac/802_11 ;
set val(ifq) Queue/DropTail/PriQueue ;
set val(ll) LL;
set val(ant) Antenna/OmniAntenna ;
set val(ifqlen) 30 ;
set val(nn) 60 ;
set val(rp) AODV ;
set val(x) 300 ;
set val(y) 300 ;
set val(stop) 50 ;

#RNG with normal distribution
set num [new RandomVariable/Normal]
$num set max_ 60
$num set min_ 0
$num set avg_ 17


set ns [new Simulator]

set tracefd [open wirelessnet.tr w]

set winFile [open CwMaodv_30 w]

set namtracefd [open wrls2.1.nam w]

$ns trace-all $tracefd
$ns use-newtrace

$ns namtrace-all-wireless $namtracefd $val(x) $val(y)

set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

$ns node-config -adhocRouting $val(rp) \
                -llType $val(ll) \
                -macType $val(mac) \
                -ifqType $val(ifq) \
                -ifqLen $val(ifqlen) \
                -antType $val(ant) \
                -propType $val(prop) \
                -phyType $val(netif) \
                -channelType $val(chan) \
                -topoInstance $topo \
                -agentTrace ON \
                -routerTrace ON \
                -macTrace OFF \
                -movementTrace OFF \


for {set i 0} {$i < $val(nn) } {incr i} {
  set node_($i) [$ns node]
 }

$node_(0) set X_ 95.0
$node_(0) set Y_ 50.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 60.0
$node_(1) set Y_ 50.0
$node_(1) set Z_ 0.0

$node_(2) set X_ 25.0
$node_(2) set Y_ 190.0
$node_(2) set Z_ 0.0

$node_(3) set X_ 135.0
$node_(3) set Y_ 155.0
$node_(3) set Z_ 0.0

$node_(4) set X_ 105.0
$node_(4) set Y_ 180.0
$node_(4) set Z_ 0.0

$node_(5) set X_ 110.0
$node_(5) set Y_ 200.0
$node_(5) set Z_ 0.0

$node_(6) set X_ 55.0
$node_(6) set Y_ 75.0
$node_(6) set Z_ 0.0

$node_(7) set X_ 1.0
$node_(7) set Y_ 20.0
$node_(7) set Z_ 0.0

$node_(8) set X_ 175.0
$node_(8) set Y_ 90.0
$node_(8) set Z_ 0.0

$node_(9) set X_ 115.0
$node_(9) set Y_ 115.0
$node_(9) set Z_ 0.0

$node_(10) set X_ 75.0
$node_(10) set Y_ 175.0
$node_(10) set Z_ 0.0

$node_(11) set X_ 150.0
$node_(11) set Y_ 135.0
$node_(11) set Z_ 0.0

$node_(12) set X_ 45.0
$node_(12) set Y_ 90.0
$node_(12) set Z_ 0.0

$node_(13) set X_ 10.0
$node_(13) set Y_ 45.0
$node_(13) set Z_ 0.0

$node_(14) set X_ 90.0
$node_(14) set Y_ 1.0
$node_(14) set Z_ 0.0

$node_(15) set X_ 110.0
$node_(15) set Y_ 100.0
$node_(15) set Z_ 0.0

$node_(16) set X_ 160.0
$node_(16) set Y_ 120.0
$node_(16) set Z_ 0.0

$node_(17) set X_ 180.0
$node_(17) set Y_ 20.0
$node_(17) set Z_ 0.0

$node_(18) set X_ 120.0
$node_(18) set Y_ 10.0
$node_(18) set Z_ 0.0

$node_(19) set X_ 190.0
$node_(19) set Y_ 1.0
$node_(19) set Z_ 0.0

$node_(20) set X_ 150.0
$node_(20) set Y_ 135.0
$node_(20) set Z_ 0.0

$node_(21) set X_ 45.0
$node_(21) set Y_ 190.0
$node_(21) set Z_ 0.0

$node_(22) set X_ 200.0
$node_(22) set Y_ 45.0
$node_(22) set Z_ 0.0

$node_(23) set X_ 275.0
$node_(23) set Y_ 1.0
$node_(23) set Z_ 0.0

$node_(24) set X_ 260.0
$node_(24) set Y_ 100.0
$node_(24) set Z_ 0.0

$node_(25) set X_ 245.0
$node_(25) set Y_ 120.0
$node_(25) set Z_ 0.0

$node_(26) set X_ 230.0
$node_(26) set Y_ 225.0
$node_(26) set Z_ 0.0

$node_(27) set X_ 215.0
$node_(27) set Y_ 220.0
$node_(27) set Z_ 0.0

$node_(28) set X_ 300.0
$node_(28) set Y_ 200.0
$node_(28) set Z_ 0.0

$node_(29) set X_ 290.0
$node_(29) set Y_ 210.0
$node_(29) set Z_ 0.0

$node_(30) set X_ 150.0
$node_(30) set Y_ 29.0
$node_(30) set Z_ 0.0

$node_(31) set X_ 200
$node_(31) set Y_ 212.0
$node_(31) set Z_ 0.0

$node_(32) set X_ 190.0
$node_(32) set Y_ 110.0
$node_(32) set Z_ 0.0

$node_(33) set X_ 221.0
$node_(33) set Y_ 45.0
$node_(33) set Z_ 0.0

$node_(34) set X_ 290.0
$node_(34) set Y_ 210.0
$node_(34) set Z_ 0.0

$node_(35) set X_ 44.0
$node_(35) set Y_ 245.0
$node_(35) set Z_ 0.0

$node_(36) set X_ 184.0
$node_(36) set Y_ 96.0
$node_(36) set Z_ 0.0

$node_(37) set X_ 200.0
$node_(37) set Y_ 110.0
$node_(37) set Z_ 0.0

$node_(38) set X_ 61.0
$node_(38) set Y_ 119.0
$node_(38) set Z_ 0.0

$node_(39) set X_ 100.0
$node_(39) set Y_ 176.0
$node_(39) set Z_ 0.0

$node_(40) set X_ 65.0
$node_(40) set Y_ 230.0
$node_(40) set Z_ 0.0

$node_(41) set X_ 95.0
$node_(41) set Y_ 96.0
$node_(41) set Z_ 0.0

$node_(42) set X_ 151.0
$node_(42) set Y_ 170.0
$node_(42) set Z_ 0.0

$node_(43) set X_ 157.0
$node_(43) set Y_ 172.0
$node_(43) set Z_ 0.0

$node_(44) set X_ 66.0
$node_(44) set Y_ 177.0
$node_(44) set Z_ 0.0

$node_(45) set X_ 144.0
$node_(45) set Y_ 157.0
$node_(45) set Z_ 0.0

$node_(46) set X_ 77.0
$node_(46) set Y_ 20.0
$node_(46) set Z_ 0.0

$node_(47) set X_ 123.0
$node_(47) set Y_ 82.0
$node_(47) set Z_ 0.0

$node_(48) set X_ 222.0
$node_(48) set Y_ 168.0
$node_(48) set Z_ 0.0

$node_(49) set X_ 297.0
$node_(49) set Y_ 213.0
$node_(49) set Z_ 0.0

$node_(50) set X_ 202.0
$node_(50) set Y_ 144.0
$node_(50) set Z_ 0.0

$node_(51) set X_ 252.0
$node_(51) set Y_ 104.0
$node_(51) set Z_ 0.0

$node_(52) set X_ 113.0
$node_(52) set Y_ 37.0
$node_(52) set Z_ 0.0

$node_(53) set X_ 41.0
$node_(53) set Y_ 147.0
$node_(53) set Z_ 0.0

$node_(54) set X_ 182.0
$node_(54) set Y_ 222.0
$node_(54) set Z_ 0.0

$node_(55) set X_ 63.0
$node_(55) set Y_ 121.0
$node_(55) set Z_ 0.0

$node_(56) set X_ 123.0
$node_(56) set Y_ 241.0
$node_(56) set Z_ 0.0

$node_(57) set X_ 111.0
$node_(57) set Y_ 222.0
$node_(57) set Z_ 0.0

$node_(58) set X_ 72.0
$node_(58) set Y_ 14.0
$node_(58) set Z_ 0.0

$node_(59) set X_ 157.0
$node_(59) set Y_ 133.0
$node_(59) set Z_ 0.0

$node_(60) set X_ 146.0
$node_(60) set Y_ 13.0
$node_(60) set Z_ 0.0


$ns at 10.0 "$node_(4) setdest 140.0 80.0 8.0"
$ns at 10.0 "$node_(8) setdest 125.0 100.0 8.0"
$ns at 10.0 "$node_(10) setdest 190.0 160.0 8.0"
$ns at 10.0 "$node_(18) setdest 70.0 120.0 8.0"
$ns at 10.0 "$node_(14) setdest 210.0 170.0 8.0"
$ns at 10.0 "$node_(22) setdest 125.0 100.0 8.0"
$ns at 10.0 "$node_(25) setdest 100.0 185.0 8.0"
$ns at 10.0 "$node_(29) setdest 10.0 120.0 8.0"

set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns at 0.1 "$ftp start"

for {set i 0} {$i < $val(nn) } {incr i} {
 $ns initial_node_pos $node_($i) 10
 }

for {set i 0} {$i < $val(nn) } {incr i} {
 $ns at $val(stop) "$node_($i) reset"
}

##CHANGE 42
for {set i 0} {$i < 42} {incr i} {
    #create udp agent on every node
    set udp($i) [new Agent/UDP]
    $ns attach-agent $node_($i) $udp($i)
    #attach cbr traffic to every udp
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) set packetSize_ 1000
    $cbr($i) set interval_ 0.015
    $cbr($i) attach-agent $udp($i)
    #create null receiver agents on every node
    set null($i) [new Agent/Null]
    $ns attach-agent $node_($i) $null($i)
    
}

for {set i 0} {$i < 42} {incr i} {
    $ns connect $udp($i) $null([expr int([$num value])])
}
for {set i 0} {$i < 42}  {incr i} {
    $ns at $i "$cbr($i) start"
    $ns at $val(stop) "stop"
}

$ns at $val(stop) "stop"

proc plotWindow {tcpSource file} {
 global ns
 set time 0.1
 set now [$ns now]
 set cwnd [$tcpSource set cwnd_]
 puts $file "$now $cwnd"
 $ns at [expr $now+$time] "plotWindow $tcpSource $file"
}

$ns at 0.1 "plotWindow $tcp $winFile"

proc stop {} {
 global ns tracefd namtracefd
 $ns flush-trace
 close $tracefd
 close $namtracefd
 exec nam wrls2.1.nam &
 exit 0
}

$ns run
