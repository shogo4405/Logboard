# Logboard
[![Release](https://img.shields.io/github/v/release/shogo4405/Logboard)](https://github.com/shogo4405/Logboard/releases/latest)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fshogo4405%2FLogboard%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/shogo4405/Logboard)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fshogo4405%2FLogboard%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/shogo4405/Logboard)
[![GitHub license](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://raw.githubusercontent.com/shogo4405/Logboard/master/LICENSE.md)

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
|-|iOS|macOS|tvOS|watchOS|visionOS|Xcode|Swift|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|2.5.0+|13.0+|10.15+|13.0+|6.0|-|15.3+|5.8|
|2.4.1+|12.0+|10.13+|12.0+|4.0|1.0+|15.0+|5.3|

## Installation
### CocoaPods
```rb
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def import_pods
pod 'Logboard', '~> 2.4.1'
end

target 'Your Target'  do
platform :ios, '12.0'
import_pods
end
```
### Carthage
```
github "shogo4405/Logboard" ~> 2.4.1
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
