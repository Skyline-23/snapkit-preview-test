//
//  customTextField.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/21.
//

import UIKit
import SnapKit
import Then

class customTextField: UIView {

    // MARK: - Properties
    
    // MARK: - UI
    let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.text = "Hello World!"
        $0.backgroundColor = .blue
    }
    
    let textField = UITextField().then {
        $0.clearButtonMode = .whileEditing
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(titleLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(32)
            $0.right.equalTo(self.snp.right).offset(-32)
            $0.top.equalTo(self.snp.top).offset(32)
        }
    }
}
