//
//  SliderViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct SliderViewDemo: View {
    @State private var value = 0.5
    var body: some View {
        VStack {
            Slider(value: $value)
            Text("Value: \(value, specifier: "%.2f")")
            Spacer()
        }
        .padding()
    }
}
