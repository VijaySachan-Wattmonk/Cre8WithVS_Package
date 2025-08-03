//
//  VStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct VStackDemo: View {
    var body: some View {
        VStack {
            Text("VStack")
                .font(.headline)
            VStack(alignment: .leading, spacing: 10) {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .padding()
            .background(.blue.opacity(0.2))
            .cornerRadius(8)
        }
    }
}
