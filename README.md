<!-- Cron Wall -->

<p align="center">
  <img src="https://www.gnu.org/graphics/gplv3-127x51.png"> - an hourly <code>Cron</code> job to set wallpaper based on the hour of the day using a <code>Bash</code> script
</p>

<p align="center"></p>

### Overview

+ Comes with these [Wallpaper-Set](https://github.com/atulrpai/cron-wall/tree/master/Wallpaper-Set) each containing 24H-Wallpapers

+ You may also add more of your own Wallpaper-Set
  + the 24H-Wallpapers must be numbered from 0 to 23 for each hour of the day
  + supported image formats are "jpg", "jpeg" and "png"
  + name the container directory as you wish and place it in the <code>Wallpaper-Set</code> directory

### Setup

+ Clone this repository -
```
$ git clone https://github.com/atulrpai/cron-wall.git
```

+ Change to cloned directory and find path for <code>PROJECT_ROOT</code> -
```
$ cd cron-wall
$ pwd
```

+ Edit <code>cron.sh</code> and update <code>line #2</code> to set <code>PROJECT_ROOT</code> -
```
PROJECT_ROOT=/path/to/cron-wall
```

+ Add <code>*/60 * * * * /path/to/cron-wall/cron.sh</code> entry in the list of <code>Cron</code> jobs -
```
$ crontab -e
```
  + To save and exit, hit Ctrl-S and then Ctrl-X


### Notes
  + Wallpaper updates at the next full hour after boot i.e at 0800 HR even if booted at 0701 HR