test_date=`date "+%Y%m%d_%H%M%S"`
touch data_store/result_traffic_test$test_date
for i in 64 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 
do
echo "rem_device_all"            > /proc/net/pktgen/kpktgend_0
echo "add_device eth1"           > /proc/net/pktgen/kpktgend_0
echo "count 10000"               > /proc/net/pktgen/eth1
echo "clone_skb 1"               > /proc/net/pktgen/eth1
echo "pkt_size 64"               > /proc/net/pktgen/eth1
echo "delay 0"                   > /proc/net/pktgen/eth1
echo "src_min 192.168.31.110"          > /proc/net/pktgen/eth1
echo "src_max 192.168.31.110"          > /proc/net/pktgen/eth1
echo "src_mac 08:00:27:4c:e6:6f" > /proc/net/pktgen/eth1
echo "dst 192.168.31.101"              > /proc/net/pktgen/eth1
echo "dst_mac 08:00:27:c6:66:16" > /proc/net/pktgen/eth1
echo "start"                     > /proc/net/pktgen/pgctrl
echo -n $i   |tee -a data_store/result_traffic_test$test_date
tail  /proc/net/pktgen/eth1 -n 1 |tee -a data_store/result_traffic_test$test_date
sleep 5 
done
#awk '{print $1,"\t",$3}' data_store/result_traffic_test$test_date | ./gnuploter.sh  graph_store/bandwidth-graph$test_date.png
#awk '{print $1,"\t",$2,"\t",$3}' data_store/result_traffic_test$test_date | ./gnuploter.sh  graph_store/bandwidth-graph$test_date.png
awk '{print $1,"\t",$3}' data_store/result_traffic_test$test_date | ./gnuploter.sh  graph_store/bandwidth-graph$test_date.png
