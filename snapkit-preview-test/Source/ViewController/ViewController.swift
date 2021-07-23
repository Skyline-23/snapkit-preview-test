//
//  ViewController.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/20.
//

import UIKit
import AcknowList

class ViewController: UIViewController {
    
    // MARK: - UI
    let textField = customTextField().then {
        $0
    }
    
    let button = UIButton().then {
        $0.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.setTitle("오픈소스 보기", for: .normal)
        $0.addTarget(self, action: #selector(touched(_:)), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func touched(_ sender: UIButton) {
        let viewcontroller = AcknowListViewController()
        viewcontroller.title = "오픈소스 라이브러리"
        let navigationcontroller = UINavigationController(rootViewController: viewcontroller)
        present(navigationcontroller, animated: true, completion: nil)
    }

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.backgroundColor = .white
        
        self.button.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(32)
            $0.right.equalTo(self.view).offset(-32)
            $0.height.equalTo(45)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
//            $0.center.equalTo(self.view).offset(50)
        }
        // Do any additional setup after loading the view.
    }


}
