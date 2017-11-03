import Foundation

public class ConsoleAppender: LogboardAppender {
    private var dateFormatter:DateFormatter = {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mma"
        dateFormatter.locale = .current
        return dateFormatter
    }()

    public init() {
    }

    public func append(_ logboard:Logboard, level: Logboard.Level, message:String, file:StaticString, function:StaticString, line:Int) {
        print(dateFormatter.string(from: Date()), "[\(level)]", "[\(logboard.identifier)]", "[\(line)]", function, ">", message)
    }
    public func append(_ logboard:Logboard, level: Logboard.Level, format:String, arguments:CVarArg, file:StaticString, function:StaticString, line:Int) {
        print(dateFormatter.string(from: Date()), "[\(level)]", "[\(logboard.identifier)]", "[\(line)]", function, ">", String(format: format, arguments))
    }
}
