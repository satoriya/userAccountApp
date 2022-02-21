//
//  Extension.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 15/02/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func setAttributedBtn(normalText: String, boldText: String = "") {
        
        let attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black.withAlphaComponent(0.7), .font: UIFont.systemFont(ofSize: 13)]
        let attrTitel = NSMutableAttributedString(string: "\(normalText) ", attributes: attr)
        
        let boldAttr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black.withAlphaComponent(0.7), .font: UIFont.boldSystemFont(ofSize: 13)]
        attrTitel.append(NSAttributedString(string: boldText, attributes: boldAttr))

        setAttributedTitle(attrTitel, for: .normal)
    }
    
    func setSubmitBtn(with title: String, bgColor: UIColor = .white, fontColor: UIColor = .black) {
        
        setHeight(70)
        
        setTitle(title.uppercased(), for: .normal)
        layer.cornerRadius = 35
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        clipsToBounds = true
        
        backgroundColor = bgColor
        setTitleColor(fontColor, for: .normal)
    }
}

extension UIView {
    func anchor(
    top: NSLayoutYAxisAnchor? = nil,
    left: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    right: NSLayoutXAxisAnchor? = nil,
    paddingTop: CGFloat = 0,
    paddingLeft: CGFloat = 0,
    paddingBottom: CGFloat = 0,
    paddingRight: CGFloat = 0,
    width: CGFloat? = nil,
    height: CGFloat? = nil
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        //initialize constraints
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        //use minus to push item into opposite direction
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let yConstant = yConstant {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: yConstant).isActive = true
        }
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

extension UIColor {
    static func color(hex: String) -> UIColor {
        var cgString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cgString.hasPrefix("#") {
            cgString.remove(at: cgString.startIndex)
        }
        
        if cgString.count != 6  {return UIColor()}
        
        var rgbColor: UInt64 = 0
        Scanner(string: cgString).scanHexInt64(&rgbColor)
        
        return UIColor(
                red: CGFloat((Float((rgbColor & 0xff0000) >> 16)) / 255.0),
                green: CGFloat((Float((rgbColor & 0x00ff00) >> 8)) / 255.0),
                blue: CGFloat((Float((rgbColor & 0x0000ff) >> 0)) / 255.0),
                alpha: 1.0)
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}
