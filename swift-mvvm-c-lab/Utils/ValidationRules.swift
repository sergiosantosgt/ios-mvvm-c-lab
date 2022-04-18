//
//  ValidationRules.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 14/04/22.
//

import Foundation

struct Rule {
    // Return nil if matches, error message otherwise
    let check: (String) -> String?

    static let notEmpty = Rule(check: {
        return $0.isEmpty ? "Must not be empty" : nil
    })

    static let validEmail = Rule(check: {
        let regex = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}"#

        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: $0) ? nil : "Must have valid email"
    })

    static let countryCode = Rule(check: {
        let regex = #"^\+\d+.*"#

        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: $0) ? nil : "Must have prefix country code"
    })
}
