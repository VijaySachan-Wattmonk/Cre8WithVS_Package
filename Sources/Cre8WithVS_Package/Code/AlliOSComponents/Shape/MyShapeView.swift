//
//  MyShapeView.swift
//  iOS
//
//  Created by Vijay Sachan on 17/09/23.
//

import SwiftUI

struct MyShapeView: View {
    private func tips(){
        /**
         1. If you want to fill a single Shape instance with a style, use the fill(style:) shape modifier instead of foregroundStyle(_:) because it’s more efficient.
         */
    }
    private func links(){
        /**
         1. https://developer.apple.com/documentation/swiftui/shape
         2. https://developer.apple.com/documentation/swiftui/shapestyle
         3. https://swiftwithmajid.com/2021/11/17/the-many-faces-of-shapestyle-in-swiftui/
         */
    }
    var body: some View {
        Text("Check code")
        
    }
}

struct MyShapeView_Previews: PreviewProvider {
    static var previews: some View {
        MyShapeView()
    }
}
