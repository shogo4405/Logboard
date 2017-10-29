import Cocoa
import Logboard

class ViewController: NSViewController {
    var service: LogboardService?

    @IBOutlet var textFiled: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        service = LogboardService(domain: "", type: "_log._tcp", name: "Logboard", port: 22222)
        service?.delegate = self
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
            DispatchQueue.main.async {
                self.textFiled.insertText(string + "\n", replacementRange: NSMakeRange(-1, 0))
            }
        }
    }
}

