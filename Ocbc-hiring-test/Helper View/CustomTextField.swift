//
//  CustomTextField.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 15/02/22.
//

import Foundation
import UIKit

class CustomTexField: UITextField {
    
    //subclass textfield to reuse it
    init (placeholder: String) {
        super.init(frame: .zero)
        
        let space = UIView()
        space.setDimensions(height: 0, width: 12)
        leftView = space
        leftViewMode = .always
        
        borderStyle = .roundedRect
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        
        textColor = .black
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(70)
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.7)]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
