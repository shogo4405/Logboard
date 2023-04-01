# Logboard
[![Platform](https://img.shields.io/cocoapods/p/Logboard.svg?style=flat)](http://cocoapods.org/pods/Logboard)
![Language](https://img.shields.io/badge/language-Swift%205.3-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/Logboard.svg?style=flat)](http://cocoapods.org/pods/Logboard)
[![GitHub license](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://github.com/shogo4405/Logboard/blob/master/LICENSE.md)

* Simple logging framework for your framework project.
* [API Documentation](https://shogo4405.github.io/Logboard/documentation/logboard/)

## Usage
```swift
let logger = LBLogger.with("identifier")

logger.level = .trace
logger.trace("trace")
logger.debug("debug")
logger.info("hoge")
logger.warn("sample")
logger.error("error")
```

## Requirements
|-|iOS|OSX|tvOS|watchOS|Xcode|Swift|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|2.3.0+|11.0+|10.9+|11.0+|4.0|14.0+|5.3|
|2.2.0+|9.0+|10.9+|9.0+|2.0|13.0+|5.3|

## Installation
### CocoaPods
```rb
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def import_pods
pod 'Logboard', '~> 2.3.1'
end

target 'Your Target'  do
platform :ios, '11.0'
import_pods
end
```
### Carthage
```
github "shogo4405/Logboard" ~> 2.3.1
```

## Appenders
### ConsoleAppender
Use print function. You can see Xcode's console.
```swift
let logger = LBLogger.with("identifier")
let console = ConsoleAppender()
logger.appender = console
```

### MultiAppender
```swift
let logger = LBLogger.with("identifier")
let multi = MultiAppender()
multi.appenders.append(ConsoleAppender())
multi.appenders.append(SocketAppender())
logger.appender = multi
```

### SocketAppender
```swift
let logger = LBLogger.with("identifier")
let socket = SocketAppender()
socket.connect("toHost", 22222)
logger.appender = socket
```

## Network Console
iOS, macOS, tvOS, watchOS Debugging Tool, Logging console via Network.
![screenshot](https://user-images.githubusercontent.com/810189/183241560-5ceb2d7e-9421-4eb7-babb-370ce1429645.gif)

### Download
```
git clone https://github.com/shogo4405/Logboard.git
cd Logboard/Console
carthage update --platform macOS --use-xcframewokrs
```
### Build
Open xcode 'Console' and [Product] -> [Archive].

### SocketAppender
```
let logger = LBLogger.with("identifier")
let socket = SocketAppender()
socket.connect("toHost", 22222)
logger.appender = socket
```

## License
BSD-3-Clause
