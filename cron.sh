#!/bin/bash
PROJECT_ROOT=/path/to/cron-wall

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

WALLPAPER_SET=$PROJECT_ROOT/Wallpaper-Set
TODAY=$PROJECT_ROOT/Today
TODAY_SET=$TODAY/Set
TODAY_DATE=$TODAY/Date

PickRandomSet () {
 RANDOM_SET=$(ls $WALLPAPER_SET | shuf -n 1)
 echo "RANDOM SET PICKED FOR TODAY IS $RANDOM_SET"

 rm -f $TODAY_SET/*
 cp $WALLPAPER_SET/$RANDOM_SET/* $TODAY_SET
}

SetTimedWallpaper () {
 hour=$(( 10#$(date +%H) ))
 options=$(ls $TODAY_SET | wc -l)
 picked=$(( $hour * $options / 24 ))
 echo "Hour - $hour, Options - $options, Picked - $picked"
 
 formats=(jpeg jpg png)
 for format in "${formats[@]}"
 do
  if [ -f $TODAY_SET/$picked.$format ]; then
   echo "TIMED WALLPAPER PICKED $TODAY_SET/$picked.$format"
   gsettings set org.gnome.desktop.background picture-uri $TODAY_SET/$picked.$format
   break
  fi
 done
}

if [ ! -d $TODAY ]; then
  echo "$TODAY DIR MISSING"
  mkdir $TODAY
fi

if [ ! -d $TODAY_SET ]; then
  echo "$TODAY_SET DIR MISSING"
  mkdir $TODAY_SET
fi

if [ ! -f "$TODAY_DATE" ] || [ $(<$TODAY_DATE) != $(date +%d/%m/%y) ]; then
 echo "DATE FILE MISSING OR DATE CHANGED"
 date +%d/%m/%y > $TODAY_DATE

 PickRandomSet
fi

SetTimedWallpaper
