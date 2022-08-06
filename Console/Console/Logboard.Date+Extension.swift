import Foundation
import Logboard

extension Logboard.Data {
    var attributedString: NSAttributedString {
        let string = description + "\n"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.setAttributes([
            .foregroundColor: level.color
            // .font: NSFont.menuBarFont(ofSize: 12)
        ], range: NSRange(location: 0, length: string.count))
        return attributedString
    }
}
