//
//  NavigationLinkDemo.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI


struct NavigationLinkDemo: View {
    var body: some View {
        VStack {
            NavigationLink("Go to Detail Page") {
                Text("This is a detail view.")
                    .font(.title)
            }
            Spacer()
        }
        .padding()
    }
}
