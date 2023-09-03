import Foundation

/// The ConsoleAppender class can output your xcode console with print function.
public class ConsoleAppender: LBLoggerAppender {
    /// Creates a ConsoleAppender instance.
    public init() {
    }

    public func append(_ logboard: LBLogger, level: LBLogger.Level, message: [Any], file: StaticString, function: StaticString, line: Int) {
        print(LBLogger.dateFormatter.string(from: Date()), "[\(level)]", "[\(logboard.identifier)]", "[\(filename(file.description)):\(line)]", function, ">", message.map({ String(describing: $0) }).joined(separator: ""))
    }

    public func append(_ logboard: LBLogger, level: LBLogger.Level, format: String, arguments: any CVarArg, file: StaticString, function: StaticString, line: Int) {
        print(LBLogger.dateFormatter.string(from: Date()), "[\(level)]", "[\(logboard.identifier)]", "[\(filename(file.description)):\(line)]", function, ">", String(format: format, arguments))
    }
}
