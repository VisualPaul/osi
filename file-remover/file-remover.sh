bash -c "shopt -s nullglob; cd $1; rm -f `grep -P '^[^#]'`"
