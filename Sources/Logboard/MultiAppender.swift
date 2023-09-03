import Foundation

/// The MultiAppender class delegates appenders.
/// ## Example code:
/// ```
/// let multi = MultiAppender()
/// multi.appenders.append(ConsoleAppender())
/// multi.appenders.append(SocketAppender())
/// logger.appender = multi
/// ```
public class MultiAppender: LBLoggerAppender {
    /// The appenders.
    public var appenders: [any LBLoggerAppender] = []

    /// Creates a MultIAppender instance.
    public init() {
    }

    public func append(_ logboard: LBLogger, level: LBLogger.Level, message: [Any], file: StaticString, function: StaticString, line: Int) {
        for appender in appenders {
            appender.append(logboard, level: level, message: message, file: file, function: function, line: line)
        }
    }

    public func append(_ logboard: LBLogger, level: LBLogger.Level, format: String, arguments: any CVarArg, file: StaticString, function: StaticString, line: Int) {
        for appender in appenders {
            appender.append(logboard, level: level, format: format, arguments: arguments, file: file, function: function, line: line)
        }
    }
}
