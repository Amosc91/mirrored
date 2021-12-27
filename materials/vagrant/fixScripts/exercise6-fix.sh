#add fix to exercise6-fix here
#bash.sh
array=("$@")
dest=${array[-1]}
array_len=$((${#array[@]}-2))
sum=0
FILESIZE=0
ssh server2 [[ -d ${dest} ]];
if [ $? -eq 1 ]; then
        ssh server2 mkdir -p ${dest};
        echo ${dest} does not exist in remote. creating folder...;

fi

for i in $(seq 0 $array_len);
        do
        scp ${array[$i]} vagrant@server2:$dest;
        FILESIZE=$(stat -c%s ${array[$i]});
        sum=$(( $sum + $FILESIZE));
done

echo  $sum;
