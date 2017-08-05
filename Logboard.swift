import Foundation

open class Logboard {
    public enum Level: Int, CustomStringConvertible {
        case verbose
        case debug
        case info
        case warning
        case error
        case severe
        case none

        public var description: String {
            switch self {
            case .verbose:
                return "Verbose"
            case .debug:
                return "Debug"
            case .info:
                return "Info"
            case .warning:
                return "Warning"
            case .error:
                return "Error"
            case .severe:
                return "Severe"
            case .none:
                return "None"
            }
        }
    }
}
