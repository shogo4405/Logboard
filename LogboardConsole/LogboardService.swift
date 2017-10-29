import Foundation

protocol LogboardServiceDelegate: class {
    func onData(_ data:Data)
}

class LogboardService: NetService {
    weak var delegate:LogboardServiceDelegate?

    func client(inputBuffer client: NetClient) {
        delegate?.onData(client.inputBuffer)
    }
}
