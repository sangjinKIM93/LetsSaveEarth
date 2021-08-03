//
//  UITextField.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/03.
//

import UIKit

extension UITextField {
    func setCustomPlaceholder(placeholderColor: UIColor, font: UIFont) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}
