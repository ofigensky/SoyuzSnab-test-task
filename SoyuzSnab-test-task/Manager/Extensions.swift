
import Foundation
import UIKit

extension Double { //  converting Double to String 
    func toString() -> String {
        let value = self
        return String(format: "%.1f", value)
    }
}

