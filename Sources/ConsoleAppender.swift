import Foundation

public class ConsoleAppender: LogboardAppender {
    public func append(_ logboard:Logboard, level: Logboard.Level, message:String, file:StaticString, function:StaticString, line:Int) {
        print("[", level, "] [", logboard.identifier, "] [", line, "] > ", message)
    }
    public func append(_ logboard:Logboard, level: Logboard.Level, format:String, arguments:CVarArg, file:StaticString, function:StaticString, line:Int) {
        print("[", level, "] [", logboard.identifier, "] [", line, "] > ", String(format: format, arguments))
    }
}
