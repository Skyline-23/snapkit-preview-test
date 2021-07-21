//
//  Preview.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/21.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview(.iPhone12Pro)
    }
}
#endif
