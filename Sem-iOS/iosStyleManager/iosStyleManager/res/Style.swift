//
//  Style.swift
//  iosStyleManager
//
//  Created by Daria D on 11.11.2022.
//

import UIKit

struct Style: Decodable {
    let backgroundColor: String?
    let textColor: String?
}

struct StyleWrapper: Decodable {
    let content: [String: Style]
}
