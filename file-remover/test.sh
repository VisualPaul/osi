#/usr/bin/env bash
#if encoding is different from UTF-8 it may not work... Nevermind

for i in a b c d; do
    mkdir $i
    cd $i
    xargs -d '\n' -a ../$i.files touch
    cd ..
    ./file-remover.sh $i < $i.test
    if [ ! -e $i ]; then
        echo -e "Test $i: \e[31mFAILED\e[39m"
        continue
    fi
    if ls $i | diff - $i.result; then
        echo -e "Test $i: \e[32mPASSED\e[39m"
    else
        echo -e "Test $i: \e[31mFAILED\e[39m"
    fi
    rm -r $i
done
