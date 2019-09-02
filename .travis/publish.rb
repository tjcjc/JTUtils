puts ENV["TRAVIS_BRANCH"]
if ENV["TRAVIS_BRANCH"] == "release"
    system("which pod")
    system("echo 'begin publish'")
    system("pod repo add Jason https://github.com/tjcjc/Specs")
    system "/usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason remote remove origin"
    system "/usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason remote add origin https://tjcjc:$PUBLISH_KEY@github.com/tjcjc/Specs.git"
    system "/usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason fetch"
    system "/usr/local/bin/git -C /Users/travis/.cocoapods/repos/Jason branch --set-upstream-to=origin/master master"
    system "pod repo push Jason JTUtils.podspec --allow-warnings"
end