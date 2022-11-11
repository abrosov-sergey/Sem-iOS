//
//  StyleManager.swift
//  iosStyleManager
//
//  Created by Daria D on 11.11.2022.
//

import UIKit

final class StyleManager {
    enum Theme: String {
        static let key = "themeKey"
        
        case dark
        case light
    }
    
    enum Constants {
        static let fileName = ""
        static let fileType = ""
    }
    
    static let decoder = JSONDecoder()
    
    static var currentTheme: Theme {
        get {
            guard let current = UserDefaults.standard.string(forKey: Theme.key)
            else {
                return .light
            }
            return Theme(rawValue: current) ?? .light
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Theme.key)
        }
    }
    
    static func getStyle(_ style: String?) -> Style {
        guard
            let style = style,
            let path = Bundle.main.path(forResource: Constants.fileName, ofType: Constants.fileType),
            let data = try? String(contentsOfFile: path, encoding: .utf8).data(using: .utf8),
            let styles = try? decoder.decode(StyleWrapper.self, from: data),
            let result = styles.content[style]
        else {
            return Style(backgroundColor: nil, textColor: nil)
        }
        return result
    }
}
