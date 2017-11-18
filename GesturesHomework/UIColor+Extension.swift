//
//  UIColor+Extension.swift
//  GesturesHomework
//
//  Created by Vadim Shoshin on 18.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let rgbArray = Helpers.generateRandomArray(quantity: 3, maxBound: 256)
        return ( UIColor(red: rgbArray[0] / 255, green: rgbArray[1] / 255, blue: rgbArray[2] / 255, alpha: 1) )
    }
}
