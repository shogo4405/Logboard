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
|2.6.0+|15.0+|11.0+|15.0+|8.0|1.0+|26.0+|5.9|

## Installation
### Using Swift Package Manager
```rb
https://github.com/shogo4405/Logboard
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

## License
BSD-3-Clause
