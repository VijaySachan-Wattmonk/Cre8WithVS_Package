//
//  ViewContainer.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/20/25.
//
import SwiftUI
struct ViewContainer<MyContent:View> : View{
    let content:MyContent
    init( content: MyContent) {
            self.content = content
        }
   var body: some View{
       VStack{
           Text("\(String(describing: type(of: content)))")
           content
       }
    }
}
