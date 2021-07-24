//
//  customTextField.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/21.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class customTextField: UIView {
    
    let disposebag = DisposeBag()
    
    fileprivate struct Font {
        static let titleLabel = UIFont.systemFont(ofSize: 13, weight: .regular)
        static let textField = UIFont.systemFont(ofSize: 22, weight: .regular)
    }

    // MARK: - Properties
    
    // MARK: - UI
    let titleLabel = UILabel().then {
        $0.textAlignment = .left
        $0.text = " "
        $0.textColor = .red
        $0.font = Font.titleLabel
    }
    
    let textField = UITextField().then {
        $0.clearButtonMode = .whileEditing
        $0.font = Font.textField
        $0.autocapitalizationType = .none
    }
    
    let separator = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(separator)
        
        self.titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.top.equalTo(self.snp.top)
        }
        
        self.textField.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(10)
        }
        
        self.separator.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.top.equalTo(self.textField.snp.bottom).offset(5)
            $0.height.equalTo(2.5)
        }
    }
    
    func bind() {
        self.textField.rx.text.orEmpty
            .subscribe(onNext: { text in
                UIView.animate(withDuration: 0.3, animations: {
                    self.separator.backgroundColor = text == "" ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                    self.titleLabel.text = text == "" ? "텍스트를 입력해주세요!" : " "
                })
            }).disposed(by: disposebag)
    }
}
