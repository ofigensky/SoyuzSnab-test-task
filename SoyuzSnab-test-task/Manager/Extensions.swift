//
//  Extensions.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 11.10.2022.
//

import Foundation

extension Double {
    func toString() -> String {
        let value = self
        
        return String(format: "%.1f", value)
    }
}
