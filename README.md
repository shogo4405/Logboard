# Logboard
[![Platform](https://img.shields.io/cocoapods/p/Logboard.svg?style=flat)](http://cocoapods.org/pods/Logboard)
![Language](https://img.shields.io/badge/language-Swift%203.1-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/Logboard.svg?style=flat)](http://cocoapods.org/pods/Logboard)
[![GitHub license](https://img.shields.io/badge/license-New%20BSD-blue.svg)](https://raw.githubusercontent.com/shogo4405/lf.swift/master/LICENSE.txt)

Simple logging framework for your framework project.

## Usage
```swift
let logger = Logboard.with("identifier")

logger.level = .trace
logger.trace("trace")
logger.debug("debug")
logger.info("hoge")
logger.warn("sample")
logger.error("error")
```

## Requirements
|-|iOS|OSX|tvOS|watchOS|XCode|Swift|CocoaPods|Carthage|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|1.0.0|8.0+|10.9+|9.0+|2.0|8.3+|3.1|1.2.0|0.20.0+|

## Installation
### CocoaPods
```rb
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def import_pods
pod 'Logboard', '~> 1.0.0'
end

target 'Your Target'  do
platform :ios, '8.0'
import_pods
end
```
### Carthage
```
github "shogo4405/Logboard" ~> 1.0.0
```

## License
New BSD

## Donation
Bitcoin
```txt
1CWA9muX36QKBdJiRQJGpu2HvchfEpJbWr
```

