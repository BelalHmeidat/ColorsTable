//
//  CodableColor.swift
//  ColorsDescriptor
//
//  Created by Belal Hmeidat on 9/14/23.
//

import Foundation
import UIKit

class CodableColor: UIColor, Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue, alpha
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(CGFloat.self, forKey: .red)
        let green = try container.decode(CGFloat.self, forKey: .green)
        let blue = try container.decode(CGFloat.self, forKey: .blue)
        let alpha = try container.decode(CGFloat.self, forKey: .alpha)

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(alpha, forKey: .alpha)
    }

    // Convert CodableColor to a dictionary
    func toDictionary() -> [String: CGFloat] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return [
            "red": red,
            "green": green,
            "blue": blue,
            "alpha": alpha
        ]
    }

    // Initialize CodableColor from a dictionary
    convenience init?(dictionary: [String: CGFloat]) {
        guard
            let red = dictionary["red"],
            let green = dictionary["green"],
            let blue = dictionary["blue"],
            let alpha = dictionary["alpha"]
        else {
            return nil
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

