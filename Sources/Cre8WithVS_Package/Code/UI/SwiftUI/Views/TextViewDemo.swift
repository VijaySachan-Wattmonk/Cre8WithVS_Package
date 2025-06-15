//
//  TextViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI
struct TextViewDemo: View{
    var body: some View {
        VStack {
            Text("This is a Text View")
                .font(.largeTitle)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextViewDemo()
}
