gmt grdmath -R$1 -I5m 0 0 ADD = $2
while read line; do
	echo "Processing $line ..."
	echo $line | gmt grdmask -R$1 -I5m -N0/1/1 -Szk -Gdata_mask.nc=nb 
	gmt grdmath data_mask.nc $2 ADD = $2
	rm data_mask.nc
done < $3
start=0
end=$4
for ((level=start; level<=end; level++))
do
   gmt grdmath $2 $level NAN = $2
done

    