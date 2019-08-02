##### Ring topography Simulator #####
set ns [new Simulator]

set f [open out.tr w]
set nf [open out.nam w]
$ns trace-all $f
$ns namtrace-all $nf

#cleanup and run gui
proc finish {} {
        global ns nf
        $ns flush-trace
        close $nf
        exec nam out.nam &
        exit 0
}

#configurable variables
set numNodes 60
set runtime 100
set num [new RandomVariable/Normal]
$num set max_ 60
$num set min_ 0
$num set avg_ 17



#make the nodes
for {set i 0} {$i < $numNodes} {incr i} {
    set n($i) [$ns node]
}

#add the nodes to a csma/cd lan
#for {set i 0} {$i < $numNodes} {incr i} {
#    lappend listOfNodes $n($i)
#}
#set lan [$ns newLan $listOfNodes 10Mb 1ms LL Queue/DropTail MAC/Csma/Cd Channel]
# Configure for ForeignAgent and HomeAgent nodes
$ns node-config -mobileIP ON \
                 -wiredRouting ON \
		 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace OFF 


#connect the nodes with a normal distribution topography
for {set i 0} {$i < $numNodes} {incr i} {
    $ns duplex-link $n($i) $n([expr int([$num value])]) 1Mb 10ms DropTail
}

for {set i 0} {$i < $numNodes} {incr i} {
    # attach udp agents to every node
    set udp($i) [new Agent/UDP]
    $ns attach-agent $n($i) $udp($i)
    # add cbr traffic on every udp
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) set packetSize_ 1000
    $cbr($i) set interval_ 0.015
    $cbr($i) attach-agent $udp($i)
    #create null receiver agents on every node
    set null($i) [new Agent/Null]
    $ns attach-agent $n($i) $null($i)
}

#TEST send data from node 5 to node 15
#$ns connect $udp(5) $null(15)
#$ns connect $udp(1) $null(41)
#$ns connect $udp(55) $null(30)

#$ns at 1 "$cbr(5) start"
#$ns at 5 "$cbr(5) stop"
#$ns at 2 "$cbr(1) start"
#$ns at 5 "$cbr(1) stop"
#$ns at 3 "$cbr(55) start"
#$ns at 5 "$cbr(55) stop"

for {set i 0} {$i < $numNodes} {incr i} {
    $ns connect $udp($i) $null([expr int([$num value])])
}
for {set i 0} {$i < $numNodes} {incr i} {
    $ns at $i "$cbr($i) start"
    $ns at $runtime "$cbr($i) stop"
}

$ns at 100 "finish"
$ns run

