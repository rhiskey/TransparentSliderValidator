//
//  TransparencySlider.swift
//  TransparentSliderValidator
//
//  Created by Владимир Киселев on 02.05.2022.
//

import SwiftUI

struct TransparencySlider: UIViewRepresentable {
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    @State private var score: Int = 0
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue, targetValue: $targetValue, score: $score)
    }
    
    //typealias UIViewType = UISlider
}

extension TransparencySlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        @Binding var targetValue: Int
        @Binding var score: Int
        
        init(currentValue: Binding<Double>, targetValue: Binding<Int>, score: Binding<Int>) {
            self._currentValue = currentValue
            self._targetValue = targetValue
            self._score = score
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
            score = computeScore()
            sender.thumbTintColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: CGFloat(score)/100)
        }
        
        private func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue * 100))
            return 100 - difference
        }

    }
}

struct TransparencySlider_Previews: PreviewProvider {
    static var previews: some View {
        TransparencySlider(currentValue: .constant(25), targetValue: .constant(50))
    }
}
