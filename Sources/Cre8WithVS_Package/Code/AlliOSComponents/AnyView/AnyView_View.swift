//
//  AnyView_View.swift
//  iOS
//
//  Created by Vijay Sachan on 27/08/23.
//

import SwiftUI
/**    AnyView is used to hold reference of any "View" type like Text,Button,Zstak,VSatck etc */
let text="AnyView is used to hold reference of any \"View\" type like Text,Button,Zstak,VSatck etc"
struct AnyView_View: View{
    let model=CustomModel(contentView: AnyView(Text(text)))
    var body: some View {
        model.contentView
    }
}
struct CustomModel{
    let contentView: AnyView
}
struct AnyView_View_Previews: PreviewProvider {
    static var previews: some View {
        AnyView_View()
    }
}
