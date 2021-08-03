//
//  RoundedGrayTextField.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/03.
//

import UIKit

class RoundedGrayTextField: UIView {
    
    let textField = UITextField().then {
        $0.setCustomPlaceholder(placeholderColor: .systemGray2, font: .italicSystemFont(ofSize: 20))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }


    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        
        
        self.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
    
}
