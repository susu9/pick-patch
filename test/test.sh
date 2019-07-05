#!/bin/bash
testHelp() {
    python3 pick-patch --help
    assertEquals 0 $? 
}

testPick() {
    python3 pick-patch -g https://review.gerrithub.io -d -i . 460654
    assertEquals 0 $? 
}
