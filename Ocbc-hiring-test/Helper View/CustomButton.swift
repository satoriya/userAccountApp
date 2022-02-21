//
//  CustomButton.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 15/02/22.
//

import Foundation
import UIKit

class LoginButton: UIButton {
 
    init(frame: CGRect, borderColor: CGColor) {
        super.init(frame: frame)
        
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
        layer.borderColor = borderColor
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
