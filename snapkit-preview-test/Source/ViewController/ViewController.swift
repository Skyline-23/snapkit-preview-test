//
//  ViewController.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/20.
//

import UIKit
import AcknowList
import RxSwift
import RxCocoa
import RxKeyboard

class ViewController: UIViewController {
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    // MARK: - UI
    let textField = customTextField().then {
        $0.titleLabel.text = "텍스트를 입력해주세요!"
        $0.textField.placeholder = "텍스트"
        $0.textField.autocorrectionType = .no
    }
    
    let button = UIButton().then {
        $0.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.setTitle("오픈소스 보기", for: .normal)
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
        
        self.bind()
        
        self.textField.snp.makeConstraints {
            $0.left.equalTo(safeArea.snp.left).offset(20)
            $0.right.equalTo(safeArea.snp.right).offset(-20)
            $0.centerY.equalTo(safeArea.snp.centerY).offset(-100)
            $0.height.equalTo(65)
        }
        
        self.button.snp.makeConstraints {
            $0.left.equalTo(safeArea).offset(35)
            $0.right.equalTo(safeArea).offset(-35)
            $0.height.equalTo(45)
            $0.bottom.equalTo(safeArea.snp.bottom).offset(-32)
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - BIND
    private func bind() {
        self.button.rx.tap.bind {
            self.showOpenSources()
        }.disposed(by: disposeBag)
        
        RxKeyboard.instance.visibleHeight
          .drive(onNext: { keyboardHeight in
            self.button.snp.updateConstraints {
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardHeight-32)
            }
          })
          .disposed(by: disposeBag)
    }

    //MARK: - Methods
    private func showOpenSources() {
        let viewcontroller = AcknowListViewController()
        viewcontroller.title = "오픈소스 라이브러리"
        let navigationcontroller = UINavigationController(rootViewController: viewcontroller)
        present(navigationcontroller, animated: true, completion: nil)
    }
    
}
