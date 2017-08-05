import Foundation

public class Logboard {
    public enum Level: Int, CustomStringConvertible {
        case trace
        case debug
        case info
        case warn
        case error

        public var description: String {
            switch self {
            case .trace:
                return "Trace"
            case .debug:
                return "Debug"
            case .info:
                return "Info"
            case .warn:
                return "Warn"
            case .error:
                return "Error"
            }
        }
    }

    private static var instances:[String:Logboard] = [:]

    public static func with(_ identifier:String) -> Logboard {
        if instances[identifier] == nil {
            instances[identifier] = Logboard(identifier)
        }
        return instances[identifier]!
    }

    public let identifier:String
    public var level:Logboard.Level = .info
    public var appender:LogboardAppender = ConsoleAppender()

    public init(_ identifier:String) {
        self.identifier = identifier
    }

    public func isEnabledFor(level:Logboard.Level) -> Bool {
        return self.level.rawValue <= level.rawValue
    }

    public func trace(_ message:String, file:StaticString = #file, function:StaticString = #function, line:Int = #line) {
        appender.append(self, level:.trace, message: message, file: file, function: function, line: line)
    }

    public func trace(format:String, arguments:CVarArg, file:StaticString = #file, function:StaticString = #function, line: Int = #line) {
        appender.append(self, level:.trace, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    public func debug(_ message:String, file:StaticString = #file, function:StaticString = #function, line:Int = #line) {
        appender.append(self, level:.debug, message: message, file: file, function: function, line: line)
    }

    public func debug(format:String, arguments:CVarArg, file:StaticString = #file, function:StaticString = #function, line: Int = #line) {
        appender.append(self, level:.debug, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    public func info(_ message:String, file:StaticString = #file, function:StaticString = #function, line:Int = #line) {
        appender.append(self, level:.info, message: message, file: file, function: function, line: line)
    }
    
    public func info(format:String, arguments:CVarArg, file:StaticString = #file, function:StaticString = #function, line: Int = #line) {
        appender.append(self, level:.info, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    public func warn(_ message:String, file:StaticString = #file, function:StaticString = #function, line:Int = #line) {
        appender.append(self, level:.warn, message: message, file: file, function: function, line: line)
    }
    
    public func warn(format:String, arguments:CVarArg, file:StaticString = #file, function:StaticString = #function, line: Int = #line) {
        appender.append(self, level:.warn, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    public func error(_ message:String, file:StaticString = #file, function:StaticString = #function, line:Int = #line) {
        appender.append(self, level:.error, message: message, file: file, function: function, line: line)
    }
    
    public func error(format:String, arguments:CVarArg, file:StaticString = #file, function:StaticString = #function, line: Int = #line) {
        appender.append(self, level:.error, format: format, arguments: arguments, file: file, function: function, line: line)
    }
}
