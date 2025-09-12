//
//  ZStackDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
struct ZStackDemo: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 24) {
                Text("ZStack")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                // 1. Basic overlay of text on a rectangle
                Text("1. Basic overlay of text on a rectangle")
                    .font(.subheadline)
                    .bold()
                ZStack {
                    Rectangle()
                        .fill(.orange)
                        .frame(width: 150, height: 100)
                    Text("Overlaid Text")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                Divider()
                
                // 2. Using alignment in ZStack
                Text("2. Using alignment in ZStack")
                    .font(.subheadline)
                    .bold()
                ZStack(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 180, height: 100)
                    Text("Bottom Right")
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Divider()
                
                // 3. Overlapping shapes with different colors
                Text("3. Overlapping shapes with different colors")
                    .font(.subheadline)
                    .bold()
                ZStack {
                    Circle()
                        .fill(Color.red.opacity(0.7))
                        .frame(width: 80, height: 80)
                    Circle()
                        .fill(Color.green.opacity(0.7))
                        .frame(width: 80, height: 80)
                        .offset(x: 40)
                    Circle()
                        .fill(Color.blue.opacity(0.7))
                        .frame(width: 80, height: 80)
                        .offset(x: 20, y: 40)
                }
                .frame(height: 120)
                
                Divider()
                
                // 4. Using .offset to position children relative to each other
                Text("4. Using .offset to position children")
                    .font(.subheadline)
                    .bold()
                ZStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 48))
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray.opacity(0.5))
                        .font(.system(size: 48))
                        .offset(x: 20, y: 20)
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 32))
                        .offset(x: -24, y: -16)
                }
                .frame(height: 70)
                
                Divider()
                
                // 5. Nesting ZStack with alignment guides
                Text("5. Nesting ZStack with alignment guides")
                    .font(.subheadline)
                    .bold()
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .fill(Color.purple.opacity(0.15))
                        .frame(width: 180, height: 100)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.purple)
                            .frame(width: 80, height: 40)
                        Text("Center")
                            .foregroundColor(.white)
                    }
                    .offset(x: 40, y: 30)
                    Text("Top Left")
                        .padding(6)
                        .background(Color.purple.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                .frame(height: 110)
            }
        }
        .padding()
    }
}

#Preview {
    ZStackDemo()
}
