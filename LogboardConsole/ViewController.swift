import Cocoa

class ViewController: NSViewController {
    var service:NetService?

    @IBOutlet var textFiled: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        service = NetService(domain: "", type: "_log._tcp", name: "Logboard", port: 4649)
        service?.startRunning()
    }

    override var representedObject: Any? {
        didSet {
        }
    }
}

extension ViewController: LogboardServiceDelegate {
    func onData(_ data: Data) {
        if let string = String(bytes: data, encoding: .utf8) {
            textFiled.insertText(string, replacementRange: NSMakeRange(-1, 0))
        }
    }
}

