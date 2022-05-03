//
//  ColorValueTextView.swift
//  TransparentSliderValidator
//
//  Created by Владимир Киселев on 02.05.2022.
//

import SwiftUI

struct ColorValueTextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .center)
            .foregroundColor(.black)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTextView(value: 50)
        }
    }
}
