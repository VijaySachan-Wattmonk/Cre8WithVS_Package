//
//  HomeView.swift
//  iOS
//
//  Created by Vijay Sachan on 26/08/23.
//
import SwiftUI
private struct ListData:Identifiable{
    let title: String
    var contentView: AnyView
    var id: String { title }
}
public struct HomeView: View {
    public init() {} // Required for public views in packages
    // Below property(var code:AppViewCode) must always be non optional type (? or ! not allowed,if we will make property optional type,code will throw error)
    @ObservedObject var code:AppViewCode = AppViewCode(printTag: "HomeView")
    @State var searchText=""
    public var body: some View{
        AppView(code: code){
            let list=List{
                ForEach(filteredArr()) { listData in
                    NavigationLink(destination: listData.contentView.navigationTitle(listData.title),label:{
                        Text(listData.title)
                    })
                }
            }.navigationTitle("Home").navigationBarTitleDisplayMode(.large)
            // .inline mode will put the title in center in navigation bar
            // .large mode will show large title and when list is scrolled,mode will automatically set to .inline mode
            // .automatic Inherit the display mode from the previous navigation item
            if #available(iOS 15.0, *){
                list.searchable(text: $searchText)
            }else{
                list
            }
        }
    }
     fileprivate func filteredArr()-> [ListData]{
        if searchText.isEmpty {
            return HomeView.arr
        } else {
            return HomeView.arr.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
        }
    private static var allArr=[ListData]()
    fileprivate static var arr:[ListData]{
        get{
            if allArr.isEmpty{
                
                allArr.append(ListData(title:"ForEach",contentView: AnyView(ForEachView())))
                allArr.append(ListData(title:"AnyView",contentView: AnyView(AnyView_View())))
                allArr.append(ListData(title:"Button",contentView: AnyView(ButtonView())))
                allArr.append(ListData(title:"Regex (Regular expression)",contentView: AnyView(RegexView())))
                allArr.append(ListData(title:"Shape (Protocol) \n A 2D shape that you can use when drawing a view",contentView: AnyView(MyShapeView())))
                if #available(iOS 16.0, *) {
                    allArr.append(ListData(title:"Blur Background\n @available from iOS 16.0",contentView: AnyView(BlurBackgroundView())))
                    allArr.append(ListData(title:"BackgroundStyle\n @available from iOS 16.0",contentView: AnyView(BackgroundStyleView())))
                }
                allArr.append(ListData(title:"Concurrency",contentView: AnyView(ConcurrencyView())))
                

                allArr.append(ListData(title:"NotificationCenter\nA notification dispatch mechanism that enables the broadcast of information to registered observers.",contentView: AnyView(NotificationCenterView())))
                allArr.append(ListData(title:"TabView\nA view that switches between multiple child views using interactive user interface elements.",contentView: AnyView(TabViewSwiftUI()))) 
                // Sort array by ascending order
                allArr = allArr.sorted(by: { $0.title < $1.title })
            }
            return allArr
        }
    }
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let view=HomeView()
        NavigationStack{
            view
        }
    }
}
