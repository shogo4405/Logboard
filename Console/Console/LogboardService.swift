import Foundation
import Logboard
import HaishinKit

protocol LogboardServiceDelegate: AnyObject {
    func onData(_ data: LBLogger.Data)
}

final class LogboardService: HaishinKit.NetService {
    weak var delegate: LogboardServiceDelegate?

    func client(inputBuffer client: NetClient) {
        guard let data = String(bytes: client.inputBuffer, encoding: .utf8) else {
            return
        }
        var space: Int = 0
        let lines = data.split(separator: "\r\n", omittingEmptySubsequences: false)
        for idx in 0..<lines.count {
            let line = lines[idx]
            space = line == "" ? space + 1 : 0
            if space == 2 {
                if let data = lines[idx - 2].data(using: .utf8) {
                    if let logboardData = LBLogger.Data(data) {
                        delegate?.onData(logboardData)
                    }
                }
                space = 0
            }
        }
        client.inputBuffer.removeAll()
    }
}
