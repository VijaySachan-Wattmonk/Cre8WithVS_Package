//
//  HomeView.swift
//  iOS
//
//  Created by Vijay Sachan on 26/08/23.
//
import SwiftUI
public struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    public init(){}
    public var body: some View {
        AppView(code: viewModel){
            List{
                ForEach(ListCategory.allCases) { category in
                    Section(header: Text(category.rawValue).pkg_FontHeader()) {
                        ForEach(viewModel.filteredItems.filter { $0.category == category }) { item in
                            NavigationLink(destination: item.contentView().navigationTitle(item.title)) {
                                VStack(alignment: .leading) {
                                    Text(item.title).pkg_FontTitle()
                                    Text(item.subTitle)
                                        .pkg_FontSubTitle()
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
        }.navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $viewModel.searchText).pkg_FontSubTitle()
        // .inline mode will put the title in center in navigation bar
        // .large mode will show large title and when list is scrolled,mode will automatically set to .inline mode
        // .automatic Inherit the display mode from the previous navigation item
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
