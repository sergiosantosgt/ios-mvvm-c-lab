//
//  FileUtils.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

struct FileUtils {
    static func loadTextFile(with name: String, ofType type: String) -> String? {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else { return nil }
        
        do {
            let content = try String(contentsOfFile: path, encoding: .utf8)
            return content
        } catch {
            return nil
        }
    }
}
