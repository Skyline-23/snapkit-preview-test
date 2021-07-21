//
//  ViewControllerPreview.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/20.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            return
        }
        
    }

    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
    
}
#endif
