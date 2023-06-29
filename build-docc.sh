##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme GivenWithLove \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/GivenWithLove.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "doctest2"

echo '<script>window.location.href += "/documentation/givenwithlove"</script>' > .docs/index.html
