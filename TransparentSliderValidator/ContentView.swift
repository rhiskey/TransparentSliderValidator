//
//  ContentView.swift
//  TransparentSliderValidator
//
//  Created by Владимир Киселев on 02.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 50
    
    var body: some View {
        TransparencySlider(value: $value)
            .padding()
            .onChange(of: value) { newValue in
                withAnimation {
                    check(newValue)
                }
            }
    }
}

extension ContentView {
    private func check(_ value: Float) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
