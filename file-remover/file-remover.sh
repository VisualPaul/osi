bash -c "shopt -s nullglob; cd $1; rm `grep -P '^[^#]'`"
