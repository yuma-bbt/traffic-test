# traffic-test
pkt-gen_test.sh
awk '{print $1,"\t",$3}' result_pktgen |./gnuploter.sh output.png
