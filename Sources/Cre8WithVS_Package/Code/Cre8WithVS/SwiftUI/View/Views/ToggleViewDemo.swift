//
//  ToggleViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct ToggleViewDemo: View {
    @State private var isOn = false
    var body: some View {
        VStack {
            Toggle("Enable Feature", isOn: $isOn)
            Spacer()
        }
        .padding()
    }
}
