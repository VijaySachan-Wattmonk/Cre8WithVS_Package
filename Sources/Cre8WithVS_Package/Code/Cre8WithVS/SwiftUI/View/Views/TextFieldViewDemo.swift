//
//  TextFieldViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct TextFieldViewDemo: View {
    @State private var name = ""
    var body: some View {
        VStack {
            TextField("Enter Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Hello, \(name)")
            Spacer()
        }
        .padding()
    }
}
