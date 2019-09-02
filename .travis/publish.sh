#!/bin/bash

if [ "$TRAVIS_BRANCH" = "release" ]; then
    pod repo add Jason https://github.com/tjcjc/Specs
    /usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason remote remove origin
    /usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason remote add origin https://tjcjc:$PUBLISH_KEY@github.com/tjcjc/Specs.git
    /usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason fetch
    /usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason branch --set-upstream-to=origin/master master
    pod repo push Jason JTUtils.podspec --allow-warnings
fi