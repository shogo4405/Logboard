import Foundation

/// An interface that manages the logging appending.
public protocol LBLoggerAppender {
    /// Appends a logging message string.
    func append(_ logboard: LBLogger, level: LBLogger.Level, message: [Any], file: StaticString, function: StaticString, line: Int)

    /// Appends a logging message with a format sting.
    func append(_ logboard: LBLogger, level: LBLogger.Level, format: String, arguments: any CVarArg, file: StaticString, function: StaticString, line: Int)
}
