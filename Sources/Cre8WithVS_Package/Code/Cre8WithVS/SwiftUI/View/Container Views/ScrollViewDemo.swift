//
//  ScrollViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        VStack {
            Text("ScrollView")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1...5, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.purple.opacity(0.7))
                            .frame(width: 80, height: 80)
                            .overlay(Text("\(i)").foregroundColor(.white))
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
        }
    }
}
