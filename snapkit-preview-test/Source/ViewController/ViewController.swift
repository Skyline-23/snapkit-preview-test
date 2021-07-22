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
        $0.backgroundColor = .blue
        $0.setTitle("hello world", for: .normal)
        $0.addTarget(self, action: #selector(touched(_:)), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func touched(_ sender: UIButton) {
        let viewcontroller = AcknowListViewController()
        let navigationcontroller = UINavigationController(rootViewController: viewcontroller)
        present(navigationcontroller, animated: true, completion: nil)
    }

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        view.backgroundColor = .white
        
        self.button.snp.makeConstraints {
            $0.left.equalToSuperview().offset(32)
            $0.right.equalToSuperview().offset(-32)
            $0.top.equalToSuperview().offset(32)
            $0.height.equalTo(90)
        }
        // Do any additional setup after loading the view.
    }


}
