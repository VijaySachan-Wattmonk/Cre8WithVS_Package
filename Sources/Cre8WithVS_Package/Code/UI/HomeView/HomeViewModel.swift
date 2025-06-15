//
//  HomeViewModel.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
@MainActor
final class HomeViewModel: AppViewCode {
    @Published var searchText = ""
    private(set) var allItems: [ListModel] = []
    init() {
        super.init(printTag: "")
        allItems.append(ListModel(title: "Button",
                      subTitle: "A tappable button element.",
                      category: .views,
                                  contentView: AnyView(ButtonView())))
        allItems.append(ListModel(title: "Blur Background",
                      subTitle: "",
                      category: .views,
                                  contentView: AnyView(BlurBackgroundView())))
        allItems.append(ListModel(title: "BackgroundStyle",
                      subTitle: "",
                      category: .views,
                                  contentView: AnyView(BackgroundStyleView())))
        allItems.append(ListModel(title: "TabView",
                      subTitle: "A view that switches between multiple child views using interactive user interface elements.",
                      category: .views,
                                  contentView: AnyView(TabViewSwiftUI())))
        
//        allItems.append(ListData(title:"Button",contentView: AnyView(ButtonView())))
//        allItems.append(ListData(title:"Blur Background",contentView: AnyView(BlurBackgroundView())))
//        allItems.append(ListData(title:"BackgroundStyle",contentView: AnyView(BackgroundStyleView())))
//        allItems.append(ListData(title:"TabView\nA view that switches between multiple child views using interactive user interface elements.",contentView: AnyView(TabViewSwiftUI())))
    }
    var filteredItems: [ListModel] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.subTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
enum ListCategory: String, CaseIterable, Identifiable {
    case views = "Views"
    case layouts = "Layouts"
    var id: String { rawValue }
}
