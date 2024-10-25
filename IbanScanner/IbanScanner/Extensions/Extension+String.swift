//
//  Extension+String.swift
//  IbanScanner
//
//  Created by hamza el aidi on 25/10/2024.
//

import Foundation

extension String {
    var isValidFrenchIBAN: Bool {
        let regex = "^FR[a-zA-Z0-9]{2}\\s?([0-9]{4}\\s?){2}([0-9]{2})([a-zA-Z0-9]{2}\\s?)([a-zA-Z0-9]{4}\\s?){2}([a-zA-Z0-9]{1})([0-9]{2})\\s?$"
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
}
