dir="/home/nolan/sketchbook/$1/"
mkdir $dir
cd $dir
touch $dir + "$1.pde"
tmuxinator s editor
