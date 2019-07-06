#!/bin/bash
testBasic() {
    python pick-patch --help
    assertEquals 0 $? 
}

testPick() {
    if [ ! -e "~/.netrc" ]; then
        python pick-patch -u susu9 -p ${GERRITHUB_API_PASSWORD} -g https://review.gerrithub.io -d -i . 460654
    else
        python pick-patch -g https://review.gerrithub.io -d -i . 460654
    fi
    assertEquals 0 $? 
}
