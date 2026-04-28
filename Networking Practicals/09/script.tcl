set ns [new Simulator]
set n0 [$ns node]
set n1 [$ns node]
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
set udp [new Agent/UDP]
$ns attach-agent $n0 $udp
set null [new Agent/Null]
$ns attach-agent $n1 $null
$ns connect $udp $null
$ns at 0.5 "$udp start"
$ns at 2.0 "finish"
proc finish {} {
    global ns
    $ns halt
}
$ns run
