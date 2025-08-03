//
//  ShapesDemoView.swift
//  iOS
//
//  Created by Vijay Sachan on 20/09/23.
//

import SwiftUI
struct ShapesDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Rectangle
                VStack {
                    Text("Rectangle")
                        .font(.headline)
                    Rectangle()
                        .fill(.blue)
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .cornerRadius(8)
                }
                
                // RoundedRectangle
                VStack {
                    Text("RoundedRectangle")
                        .font(.headline)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.green)
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
                
                // Circle
                VStack {
                    Text("Circle")
                        .font(.headline)
                    Circle()
                        .fill(.red)
                        .frame(width: UIScreen.main.bounds.width * 0.5) // 👈 Half screen width
                        .aspectRatio(1, contentMode: .fit)
                }
                
                // Ellipse
                VStack {
                    Text("Ellipse")
                        .font(.headline)
                    Ellipse()
                        .fill(.orange)
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
                
                // Capsule
                VStack {
                    Text("Capsule")
                        .font(.headline)
                    Capsule()
                        .fill(.purple)
                        .frame(maxWidth: .infinity, minHeight: 80)
                }
                
                // Stroke Example
                VStack {
                    Text("RoundedRectangle with Stroke")
                        .font(.headline)
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.pink, lineWidth: 4)
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
                
                // Gradient Fill
                VStack {
                    Text("Rectangle with Gradient Fill")
                        .font(.headline)
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [.yellow, .pink],
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .cornerRadius(8)
                }
                
                // Custom Shape (Triangle)
                VStack {
                    Text("Custom Triangle")
                        .font(.headline)
                    Triangle()
                        .fill(.cyan)
                        .frame(maxWidth: .infinity, minHeight: 150)
                }
            }
            .padding()
        }
    }
}

// MARK: - Custom Shape Example (Triangle)
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ShapesDemoView()
}
