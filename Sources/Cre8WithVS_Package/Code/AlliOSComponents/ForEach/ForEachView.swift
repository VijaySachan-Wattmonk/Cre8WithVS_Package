//
//  ForEachView.swift
//  iOS
//
//  Created by Vijay Sachan on 26/08/23.
//
import SwiftUI
struct ForEachView:View{
    private let namedFonts: [NamedFont] = [
        NamedFont(name: "Large Title", font: .largeTitle),
        NamedFont(name: "Title", font: .title),
    ]
    var body: some View{
        List{
            // Example 1
            Section {
                ForEach((1...2), id: \.self){
                    i in
                    Text(" Text \(i)")
                }
            } header: {Text("Example 1")
            } footer: {
                Text("Footer ")
            }
            // Example 2
            Section{
                ForEach(namedFonts) { namedFont in
                    Text(namedFont.name)
                        .font(namedFont.font)
                }
            } header: {Text("Example 2")
            }
        }.listStyle(.automatic)
    }
}
private struct NamedFont: Identifiable {
    let name: String
    let font: Font
    var id: String { name }
}
struct ForEachView_Previews: PreviewProvider {
    static var previews: some View{
        ForEachView()
    }
}
