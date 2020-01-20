#!/bin/bash
# Usage: shunit2 test.sh

init_netrc() {
    if [ -e ~/.netrc ]; then
        return
    fi
    echo "Create ~/.netrc"
    sudo echo "machine review.gerrithub.io login ${GERRITHUB_API_USER} password ${GERRITHUB_API_PASSWORD}" > ~/.netrc
}

testBasic() {
    python pick-patch --help
    assertEquals 0 $? 
}

testPick() {
    init_netrc
    python pick-patch -g https://review.gerrithub.io -d -i . 460654 -x 'git log --oneline -1'
    assertEquals 0 $? 
}

testQuery() {
    init_netrc
    python pick-patch -g https://review.gerrithub.io -d -i . -q 'owner:"Rick chang" after:"2019-07-05 22:00:00 -0700"'
    assertEquals 0 $?
}

init_pickrc() {
    if [ -e ~/.pickrc ]; then
        return
    fi
    echo "Create ~/.pickrc"
    sudo sed -e "s/\$USER/${GERRITHUB_API_USER}/" -e "s/\$PASSWORD/${GERRITHUB_API_PASSWORD}/" test/pickrc.test > ~/.pickrc
}

testConfig() {
    init_netrc
    init_pickrc
    python pick-patch -d -i . 460654/2 482097
    assertEquals 0 $?
}
