import Cocoa

class ViewController: NSViewController {
    var service:NetService?

    override func viewDidLoad() {
        super.viewDidLoad()
        service = NetService(domain: <#T##String#>, type: <#T##String#>, name: <#T##String#>, port: <#T##Int32#>)
    }

    override var representedObject: Any? {
        didSet {
        }
    }
}

