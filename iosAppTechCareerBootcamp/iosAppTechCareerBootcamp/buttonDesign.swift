//
//  buttonDesign.swift
//  iosAppTechCareerBootcamp
//
//  Created by Elıf on 22.08.2022.
//

import UIKit

@IBDesignable
class buttonDesign: UIButton {

    @IBInspectable var buttons:Bool = false {
        didSet {
            if buttons {
                layer.cornerRadius = frame.height / 2
                layer.shadowOpacity = 0.4
                layer.shadowOffset = CGSize(width: 1, height: 1)
                layer.borderWidth = 0.1
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if buttons {
            layer.cornerRadius = frame.height / 2
            layer.shadowOpacity = 0.4

        }
    }
}
