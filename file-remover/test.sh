#/usr/bin/env bash
#if encoding is different from UTF-8 it may not work... Nevermind
root=`pwd`
for i in a b c d; do
    mkdir /tmp/$i
    pushd /tmp/$i > /dev/null
    xargs -d '\n' -a $root/$i.files touch
    popd > /dev/null
    ./file-remover.sh /tmp/$i < $i.test
    if [ ! -e /tmp/$i ]; then
        echo -e "Test $i: \e[31mFAILED\e[39m"
        continue
    fi
    if ls /tmp/$i | diff -b - $i.result; then
        echo -e "Test $i: \e[32mPASSED\e[39m"
    else
        echo -e "Test $i: \e[31mFAILED\e[39m"
    fi
    rm -r /tmp/$i
done
