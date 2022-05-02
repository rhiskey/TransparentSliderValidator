//
//  TransparencySlider.swift
//  TransparentSliderValidator
//
//  Created by Владимир Киселев on 02.05.2022.
//

import SwiftUI

struct TransparencySlider: UIViewRepresentable {
    @Binding var value: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    //typealias UIViewType = UISlider
    
}

struct TransparencySlider_Previews: PreviewProvider {
    static var previews: some View {
        TransparencySlider(value: .constant(100))
    }
}
