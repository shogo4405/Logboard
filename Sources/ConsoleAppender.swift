import Foundation

public class ConsoleAppender: LogboardAppender {
    public init() {
    }

    public func append(_ logboard:Logboard, level: Logboard.Level, message:String, file:StaticString, function:StaticString, line:Int) {
        print("[\(level)]", "[\(logboard.identifier)]", "[\(line)]", function, ">", message)
    }
    public func append(_ logboard:Logboard, level: Logboard.Level, format:String, arguments:CVarArg, file:StaticString, function:StaticString, line:Int) {
        print("[\(level)]", "[\(logboard.identifier)]", "[\(line)]", function, ">", String(format: format, arguments))
    }
}
