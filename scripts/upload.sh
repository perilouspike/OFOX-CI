#!/bin/bash
source $CONFIG
cd /tmp/ci/out/target/product/$DEVICE
echo "Image File:" >> upload.txt
curl --upload-file $OUTPUT https://free.keep.sh >> upload.txt
if [ $ALT_FILE = "empty" ] ;then
echo "No Alt file is set"
else
echo "Recovery Zip:" >> upload.txt
curl --upload-file $ALT_FILE https://free.keep.sh >> upload.txt
fi
wget https://github.com/Sushrut1101/GoFile-Upload/raw/master/upload.sh >> /dev/null
chmod +x upload.sh
sudo apt install jq -y >> /dev/null
./upload.sh $OUTPUT
echo
if [ $ALT_FILE = "empty" ] ;then
echo "No alt file is set"
else
./upload.sh $ALT_FILE
fi
cat upload.txt
