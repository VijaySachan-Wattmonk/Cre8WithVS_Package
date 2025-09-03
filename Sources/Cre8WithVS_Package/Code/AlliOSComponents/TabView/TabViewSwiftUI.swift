//
//  TabViewSwiftUI.swift
//  iOS
//
//  Created by Vijay Sachan on 20/10/23.
//

import SwiftUI

struct TabViewSwiftUI: View {
    @State private var selectedTab = 1
    @State var showConfirmationDialog=false
    @State var currentStyleNo=1
    var body: some View {
        let tabView=TabView(selection: $selectedTab){
            VStack{
                Text("View 1")
                Button("Tap me to change selection to third tabItem"){
                    selectedTab=3
                }
            }
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }.tag(1)
            View2()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }.tag(2)
            View3()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }.tag(3)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Select TabView style"){
                   showConfirmationDialog=true
                }.confirmationDialog("Available styles", isPresented: $showConfirmationDialog){
                    Button(".automatic (The default TabView style)"){
                        currentStyleNo=1
                    }
                    Button(".page (Scroll left & right)"){
                        currentStyleNo=2
                    }
                    Button("tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always)"){
                        currentStyleNo=3
                    }
                }
            }
        }.onChange(of: selectedTab) { (oldValue,newValue) in
            /**
                             When page will change this code will invoke
             */
            print("Selected page: \(newValue)")
       }
        if currentStyleNo==1{
            tabView.tabViewStyle(.automatic)
        }else if currentStyleNo==2{
            tabView.tabViewStyle(.page)
            
            
            
        }else if currentStyleNo==3{
            tabView.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))
//            tabView.tabViewStyle(.page(indexDisplayMode:.always ))
        }
        //Pending check below tabViewStyle & indexViewStyle also
        let moreStyles={
            //tabViewStyle
            _=tabView.tabViewStyle(.page(indexDisplayMode: .always))
            _=tabView.tabViewStyle(.page(indexDisplayMode: .automatic))
            _=tabView.tabViewStyle(.page(indexDisplayMode: .never))
            //indexViewStyle
            _=tabView.indexViewStyle(.page(backgroundDisplayMode: .always))
            _=tabView.indexViewStyle(.page(backgroundDisplayMode: .automatic))
            _=tabView.indexViewStyle(.page(backgroundDisplayMode: .interactive))
            _=tabView.indexViewStyle(.page(backgroundDisplayMode: .never))
            
        }
        
    }
}
//struct View1:View{
//    var body: some View{
//        Text("View 1")
//    }
//}
struct View2:View{
    var body: some View{
        Text("View 2")
    }
}
struct View3:View{
    var body: some View{
        Text("View 3")
    }
}
struct TabViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TabViewSwiftUI()
        }
    }
}
