//
//  SliderView.swift
//  SimpleDiceGame
//
//  Created by Vinay Desiraju on 2/22/23.
//

import SwiftUI

struct SliderView: View {
    //creating a slider, that ranges between 0 to 100, with a step of 5
    @Binding var slidervalue : Double
    var body: some View {
        Slider(value: $slidervalue,in: 0...100, step: 5.0)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(slidervalue: .constant(10))
    }
}
