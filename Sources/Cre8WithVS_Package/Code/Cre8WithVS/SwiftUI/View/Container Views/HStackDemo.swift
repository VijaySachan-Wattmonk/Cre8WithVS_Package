//
//  HStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI

struct HStackDemo: View {
    var body: some View {
        VStack {
            Text("HStack")
                .font(.headline)
            HStack(spacing: 15) {
                Text("A")
                Text("B")
                Text("C")
            }
            .padding()
            .background(.green.opacity(0.2))
            .cornerRadius(8)
        }
    }
}
