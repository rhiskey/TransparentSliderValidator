//
//  ContentView.swift
//  TransparentSliderValidator
//
//  Created by Владимир Киселев on 02.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue: Int = 75
    @State private var currentValue: Double = 0.5
    @State private var showErrorAlert = false
    @State private var showCorrectAlert = false
    
    private let upperBorder = 100.0
    private let lowerBorder = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            SliderView(
                currentValue: $currentValue,
                targetValue: $targetValue,
                lowerBorder: lowerBorder,
                upperBorder: upperBorder
            )
            
            Button("Проверь меня!") {
                check(currentValue)
            }
            .alert("Wrong! Please slide \(lround(currentValue * upperBorder)) to \(targetValue)", isPresented: $showErrorAlert, actions: { })
            .alert("Correct!", isPresented: $showCorrectAlert, actions: { })
            
            Button("Начать заново") {
                targetValue = Int.random(in: Int(lowerBorder)...Int(upperBorder))
            }
        }
    }
    
}

extension ContentView {
    private func check(_ value: Double) {
        if (targetValue-5...targetValue+5).contains(lround(value * upperBorder)) {
            showCorrectAlert.toggle()
        } else {
            showErrorAlert.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    let lowerBorder: Double
    let upperBorder: Double
    
    var body: some View {
        HStack {
            ColorValueTextView(value: lowerBorder)
            TransparencySlider(
                currentValue: $currentValue,
                targetValue: $targetValue
            )
            .padding()
            ColorValueTextView(value: upperBorder)
        }
    }
}
