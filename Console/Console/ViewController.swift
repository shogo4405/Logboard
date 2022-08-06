import Cocoa
import Logboard

extension Logboard.Level {
    static public let allValues: [Logboard.Level] = [.trace, .debug, .info, .warn, .error]
}

final class ViewController: NSViewController {
    var service: LogboardService?

    @IBOutlet var textFiled: NSTextView!
    @IBOutlet var levelPopupButton: NSPopUpButton!

    private var logs: [Logboard.Data] = []
    private var level: Logboard.Level = .trace

    override func viewDidLoad() {
        super.viewDidLoad()
        service = LogboardService(domain: "", type: "_log._tcp", name: "Logboard", port: 22222)
        service?.delegate = self
        service?.startRunning()
        textFiled.textStorage?.append(NSMutableAttributedString(string: "\n"))

        for level in Logboard.Level.allValues {
            levelPopupButton.addItem(withTitle: level.description)
        }
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func didClickedTrash(_ sender: NSButton) {
        logs.removeAll()
        textFiled.string = ""
    }

    @IBAction func didChangeLevelPopupButton(_ sender: NSPopUpButton) {
        guard let level = Logboard.Level(string: sender.selectedItem?.title ?? "") else {
            return
        }
        self.level = level
        textFiled.string = ""
        let logs = self.logs.filter { level.rawValue <= $0.level.rawValue }
        for log in logs {
            textFiled.textStorage?.append(log.attributedString)
        }
        textFiled.scrollToEndOfDocument(nil)
    }

    private func render(_ data: Logboard.Data) {
        logs.append(data)
        guard level.rawValue <= data.level.rawValue else {
            return
        }
        textFiled.textStorage?.append(data.attributedString)
        textFiled.scrollToEndOfDocument(nil)
    }
}

extension ViewController: LogboardServiceDelegate {
    func onData(_ data: Logboard.Data) {
        DispatchQueue.main.async {
            self.render(data)
        }
    }
}
