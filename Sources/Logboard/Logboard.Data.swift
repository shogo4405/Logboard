import Foundation

extension Logboard {
    /// The logging message model.
    public struct Data {
        /// The date.
        public let date: Date
        /// The logging level.
        public let level: Level
        /// The identifier.
        public let identifier: String
        /// The filename.
        public let file: String
        /// The line number.
        public let line: Int
        /// The function name.
        public let function: String
        /// The message.
        public let message: String

        /// Create a Logboard.Data with data.
        public init?(_ data: Foundation.Data) {
            guard let strings: [String.SubSequence] = String(bytes: data, encoding: .utf8)?.split(separator: "\t"), 7 <= strings.count else {
                return nil
            }
            date = Logboard.dateFormatter.date(from: String(strings[0])) ?? Date()
            level = Level(string: String(strings[1])) ?? .trace
            identifier = String(strings[2])
            file = String(strings[3])
            line = Int(String(strings[4])) ?? 0
            function = String(strings[5])
            message = strings[6...].joined(separator: "\t")
        }
    }
}

extension Logboard.Data: CustomStringConvertible {
    // MARK: CustomStringConvertible
    public var description: String {
        return "\(Logboard.dateFormatter.string(from: date)) [\(level)] [\(identifier)] [\(filename(file)):\(line)] \(function) > \(message)"
    }
}
