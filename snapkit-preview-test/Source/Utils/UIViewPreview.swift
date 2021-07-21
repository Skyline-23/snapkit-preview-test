//
//  UIViewPreview.swift
//  snapkit-preview-test
//
//  Created by 김부성 on 2021/07/21.
//

import Foundation

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            return
        }
        
    }
    
    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
    
}
#endif
