import Cocoa
import Logboard

extension LBLogger.Level {
    static public let allValues: [LBLogger.Level] = [.trace, .debug, .info, .warn, .error]
}

final class ViewController: NSViewController {
    var service: LogboardService?

    @IBOutlet var textFiled: NSTextView!
    @IBOutlet var levelPopupButton: NSPopUpButton!

    private var logs: [LBLogger.Data] = []
    private var level: LBLogger.Level = .trace

    override func viewDidLoad() {
        super.viewDidLoad()
        service = LogboardService(domain: "", type: "_log._tcp", name: "Logboard", port: 22222)
        service?.delegate = self
        service?.startRunning()
        textFiled.textStorage?.append(NSMutableAttributedString(string: "\n"))

        for level in LBLogger.Level.allValues {
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
        guard let level = LBLogger.Level(string: sender.selectedItem?.title ?? "") else {
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

    private func render(_ data: LBLogger.Data) {
        logs.append(data)
        guard level.rawValue <= data.level.rawValue else {
            return
        }
        textFiled.textStorage?.append(data.attributedString)
        textFiled.scrollToEndOfDocument(nil)
    }
}

extension ViewController: LogboardServiceDelegate {
    func onData(_ data: LBLogger.Data) {
        DispatchQueue.main.async {
            self.render(data)
        }
    }
}
