import Foundation

#if canImport(OSLog)
import OSLog
#endif

/// The OSLoggerAppender class can output your Console.app with os_log function.
/// - seealso: https://developer.apple.com/documentation/os/logging/generating_log_messages_from_your_code
@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(tvOS 14.0, *)
@available(watchOS 7.0, *)
public class OSLoggerAppender: LogboardAppender {
    private let logger: Logger

    /// Creates a logger using the specified subsystem and category.
    public init(sybsystem: String, category: String) {
        logger = Logger(subsystem: sybsystem, category: category)
    }

    public func append(_ logboard: Logboard, level: Logboard.Level, message: [Any], file: StaticString, function: StaticString, line: Int) {
        let message =
            "[\(filename(file.description)):\(line)]" +
            function.description +
            ">" +
            message.map({ String(describing: $0) }).joined(separator: "")
        switch level {
        case .trace:
            logger.trace("\(message)")
        case .debug:
            logger.debug("\(message)")
        case .info:
            logger.info("\(message)")
        case .warn:
            logger.warning("\(message)")
        case .error:
            logger.error("\(message)")
        }
    }

    public func append(_ logboard: Logboard, level: Logboard.Level, format: String, arguments: CVarArg, file: StaticString, function: StaticString, line: Int) {
        let message =
            "[\(filename(file.description)):\(line)]" +
            function.description +
            ">" +
            String(format: format, arguments)
        switch level {
        case .trace:
            logger.trace("\(message)")
        case .debug:
            logger.debug("\(message)")
        case .info:
            logger.info("\(message)")
        case .warn:
            logger.warning("\(message)")
        case .error:
            logger.error("\(message)")
        }
    }
}
