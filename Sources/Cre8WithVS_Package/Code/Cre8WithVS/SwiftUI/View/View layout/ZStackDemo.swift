//
//  ZStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct ZStackDemo: View {
    var body: some View {
        VStack {
            Text("ZStack")
                .font(.headline)
            ZStack {
                Rectangle()
                    .fill(.orange)
                    .frame(width: 150, height: 100)
                Text("Overlaid Text")
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
    }
}
