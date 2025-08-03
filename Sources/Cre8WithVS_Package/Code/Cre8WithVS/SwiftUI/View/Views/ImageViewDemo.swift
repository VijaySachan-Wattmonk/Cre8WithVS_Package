//
//  ImageViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct ImageViewDemo: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            Spacer()
        }
        .padding()
    }
}
