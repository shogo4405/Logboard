import Foundation

/// The MultiAppender class delegates appenders.
/// ## Example code:
/// ```
/// let multi = MultiAppender()
/// multi.appenders.append(ConsoleAppender())
/// multi.appenders.append(SocketAppender())
/// logger.appender = multi
/// ```
public class MultiAppender: LogboardAppender {
    /// The appenders.
    public var appenders: [LogboardAppender] = []

    public func append(_ logboard: Logboard, level: Logboard.Level, message: [Any], file: StaticString, function: StaticString, line: Int) {
        for appender in appenders {
            appender.append(logboard, level: level, message: message, file: file, function: function, line: line)
        }
    }

    public func append(_ logboard: Logboard, level: Logboard.Level, format: String, arguments: CVarArg, file: StaticString, function: StaticString, line: Int) {
        for appender in appenders {
            appender.append(logboard, level: level, format: format, arguments: arguments, file: file, function: function, line: line)
        }
    }
}
