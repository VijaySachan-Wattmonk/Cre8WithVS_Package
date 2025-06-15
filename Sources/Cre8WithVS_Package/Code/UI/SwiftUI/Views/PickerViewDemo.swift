//
//  PickerViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct PickerViewDemo: View {
    @State private var selected = "One"
    let options = ["One", "Two", "Three"]
    var body: some View {
        VStack {
            Picker("Pick an option", selection: $selected) {
                ForEach(options, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Text("Selected: \(selected)")
            Spacer()
        }
        .padding()
    }
}
