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

