import Foundation

func filename(_ file: String) -> String {
    return file.components(separatedBy: "/").last ?? file
}

/// The Logboard class is writing string messages to the LogboardAppender.
public class Logboard {
    /// The  default dateFormatter values that is yyyy-dd-MM HH:mm:ss.SSS.
    static public var dateFormatter: DateFormatter = {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM HH:mm:ss.SSS"
        return dateFormatter
    }()

    /// The logging level.
    public enum Level: Int, CustomStringConvertible {
        /// The trace log level.
        case trace = 0
        /// The debug log level.
        case debug = 1
        /// The infomative log level.
        case info  = 2
        /// The warning log level.
        case warn  = 3
        /// The error log level.
        case error = 4

        /// Ctrate a logging level from string.
        public init?(string: String) {
            switch string {
            case "Trace":
                self = .trace
            case "Debug":
                self = .debug
            case "Info":
                self = .info
            case "Warn":
                self = .warn
            case "Error":
                self = .error
            default:
                return nil
            }
        }

        /// The description represents a string expression.
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

    private static var instances: [String: Logboard] = [:]

    /// Create or get a Logboard instance.
    public static func with(_ identifier: String) -> Logboard {
        if instances[identifier] == nil {
            instances[identifier] = Logboard(identifier)
        }
        return instances[identifier]!
    }

    /// The identifier is the subsystem name.
    public let identifier: String
    /// Specifies the logging level.
    public var level: Logboard.Level = .info
    /// Specifies logging appenders.
    public var appender: LogboardAppender = ConsoleAppender()

    /// Create a logger with the identifier.
    public init(_ identifier: String) {
        self.identifier = identifier
    }

    /// Is logging enabled for the supplied level or not.
    public func isEnabledFor(level: Logboard.Level) -> Bool {
        return self.level.rawValue <= level.rawValue
    }

    /// Writes a trace message to the appender.
    public func trace(_ message: Any..., file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .trace) else { return }
        appender.append(self, level: .trace, message: message, file: file, function: function, line: line)
    }

    /// Writes a trace message to the appender with a format string.
    public func trace(format: String, arguments: CVarArg, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .trace) else { return }
        appender.append(self, level: .trace, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    /// Writes a debug message to the appender.
    public func debug(_ message: Any..., file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .debug) else { return }
        appender.append(self, level: .debug, message: message, file: file, function: function, line: line)
    }

    /// Writes a debug message to the appender  with a format string.
    public func debug(format: String, arguments: CVarArg, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .debug) else { return }
        appender.append(self, level: .debug, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    /// Writes a informative message to the appender.
    public func info(_ message: Any..., file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .info) else { return }
        appender.append(self, level: .info, message: message, file: file, function: function, line: line)
    }

    /// Writes a informative message to the appender  with a format string.
    public func info(format: String, arguments: CVarArg, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .info) else { return }
        appender.append(self, level: .info, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    /// Writes a warning message to the appender.
    public func warn(_ message: Any..., file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .warn) else { return }
        appender.append(self, level: .warn, message: message, file: file, function: function, line: line)
    }

    /// Writes a warning message to the appender  with a format string.
    public func warn(format: String, arguments: CVarArg, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .warn) else { return }
        appender.append(self, level: .warn, format: format, arguments: arguments, file: file, function: function, line: line)
    }

    /// Writes a error message to the appender.
    public func error(_ message: Any..., file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .error) else { return }
        appender.append(self, level: .error, message: message, file: file, function: function, line: line)
    }

    /// Writes a error message to the appender with a format string.
    public func error(format: String, arguments: CVarArg, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        guard isEnabledFor(level: .error) else { return }
        appender.append(self, level: .error, format: format, arguments: arguments, file: file, function: function, line: line)
    }
}
