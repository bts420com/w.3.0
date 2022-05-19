#bin #!bash

###### Adding Files ######
wget -O /app/tobrot/aria2/dht.dat https://github.com/bts420com/bts420-leech/raw/main/asset-raw/dht.dat
wget -O /app/tobrot/aria2/dht6.dat https://github.com/bts420com/bts420-leech/raw/main/asset-raw/dht6.dat
TRACKER=`curl -Ns https://github.com/bts420com/bts420-leech/raw/main/asset-raw/all.txt -: https://github.com/bts420com/bts420-leech/raw/main/asset-raw/trackers_all_http.txt -: https://github.com/bts420com/bts420-leech/raw/main/asset-raw/all -: https://github.com/bts420com/bts420-leech/raw/main/asset-raw/AT_all.txt -: https://torrends.to/torrent-tracker-list/?download=latest | awk '$1' | tr '\n' ',' | cat`
ran=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
###### Done Addding Files ######


if [[ -n $RCLONE_CONFIG_URL ]]; then
  echo "Rclone config detected 📁📁"
  wget -q $RCLONE_CONFIG_URL -O /app/rclone.conf
fi

if [[ -n $CONFIG_ENV_URL ]]; then
  echo " Found config.env File 📁📁 "
	wget -q $CONFIG_ENV_URL -O /app/config.env
fi



echo "Starting Your Bot... 👾👾"
python3 -m tobrot

