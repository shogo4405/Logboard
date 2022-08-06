import Foundation
import Logboard

extension Logboard.Level {
    var color: NSColor {
        switch self {
        case .trace:
            return .gray
        case .debug:
            return .white
        case .info:
            return .blue
        case .warn:
            return .orange
        case .error:
            return .red
        @unknown default:
            return .gray
        }
    }
}
