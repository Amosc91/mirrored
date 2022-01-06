#add fix to exercise6-fix here
#bash.sh
cp /vagrant/fixScripts/exercise6-fix.sh /home/vagrant/
files=("$@")
dest=${files[-1]}
array_len=$((${#files[@]}-2))
sum=0
FileSize=0
user="$USER"

for i in $(seq 0 $array_len);
	do
		scp ${files[$i]} $user@server2:$dest;
		FileSize=$(stat -c%s ${files[$i]});
		sum=$(($sum + $FileSize));
	done
echo $sum

