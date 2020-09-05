#!/bin/bash

d=$(date +%Y%m%d)
oldd=$(grep filename osborn.json | cut -d '-' -f 3)
md5=$(md5sum ../out/target/product/osborn/lineage-17.1-"${d}"-UNOFFICIAL-osborn.zip | cut -d ' ' -f 1)
oldmd5=$(grep '"id"' osborn.json | cut -d':' -f 2)
utc=$(grep ro.build.date.utc ../out/target/product/osborn/system/build.prop | cut -d '=' -f 2)
oldutc=$(grep datetime osborn.json | cut -d ':' -f 2)
size=$(wc -c ../out/target/product/osborn/lineage-17.1-"${d}"-UNOFFICIAL-osborn.zip | cut -d ' ' -f 1)
oldsize=$(grep size osborn.json | cut -d ':' -f 2)
oldurl=$(grep url osborn.json | cut -d ' ' -f 9)

#This is where the magic happens
sed -i "s!${oldmd5}! \"${md5}\",!g" osborn.json
sed -i "s!${oldutc}! \"${utc}\",!g" osborn.json
sed -i "s!${oldsize}! \"${size}\",!g" osborn.json
sed -i "s!${oldd}!${d}!" osborn.json
