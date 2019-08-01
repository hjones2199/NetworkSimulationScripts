##### Ring topography Simulator #####
set ns [new Simulator]

set nf [open out.nam w]
$ns namtrace-all $nf

#get a random integer
proc random_int { upper_limit } {
    return [expr int(rand() * $upper_limit + 1)]
}

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
set runtime 5

#make the nodes
for {set i 0} {$i < $numNodes} {incr i} {
    set n($i) [$ns node]
}
#connect the nodes with a ring topography
for {set i 0} {$i < $numNodes} {incr i} {
    $ns duplex-link $n($i) $n([expr ($i+1)%$numNodes]) 1Mb 10ms DropTail
}

for {set i 0} {$i < $numNodes} {incr i} {
    # attach udp agents to every node
    set udp($i) [new Agent/UDP]
    $ns attach-agent $n($i) $udp($i)
    # add cbr traffic on every udp
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) set packetSize_ 500
    $cbr($i) set interval_ 0.005
    $cbr($i) attach-agent $udp($i)
    #create null receiver agents on every node
    set null($i) [new Agent/Null]
    $ns attach-agent $n($i) $null($i)
}

#TEST send data from node 5 to node 15
$ns connect $udp(5) $null(15)

$ns at 1 "$cbr(5) start"
$ns at 5 "$cbr(5) stop"

$ns at $runtime "finish"
$ns run
