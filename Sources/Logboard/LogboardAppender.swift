import Foundation

/// An interface that manages the logging appending.
public protocol LogboardAppender {
    /// Appends a logging message string.
    func append(_ logboard: Logboard, level: Logboard.Level, message: [Any], file: StaticString, function: StaticString, line: Int)

    /// Appends a logging message with a format sting.
    func append(_ logboard: Logboard, level: Logboard.Level, format: String, arguments: CVarArg, file: StaticString, function: StaticString, line: Int)
}
