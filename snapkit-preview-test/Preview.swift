//
//  Preview.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/21.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

//struct ViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        UIViewControllerPreview {
//            let controller = ViewController()
//            return controller
//        }
//    }
//}

struct ViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let textField = customTextField()
            return textField
        }.previewLayout(.sizeThatFits)
    }
}

#endif
