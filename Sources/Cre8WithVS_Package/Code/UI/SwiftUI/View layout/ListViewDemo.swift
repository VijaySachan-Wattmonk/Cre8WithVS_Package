//
//  ListViewDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import SwiftUI

struct ListViewDemo: View {
    let fruits = ["Apple", "Banana", "Cherry"]
    var body: some View {
        VStack {
            List(fruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
    }
}
