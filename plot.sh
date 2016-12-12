sudo su 
awk '{print $1,"\t",$3}' result_traffic*| ./gnuploter.sh  output.png
