//
//  HomeViewModel.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//

import SwiftUI
final class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    private(set) var allItems: [ListModel] = [
        ListModel(title: "Button",
                  subTitle: "A tappable button element.",
                  category: .views,
                  closure: AnyView(ButtonView())),
        
        ListModel(title: "VStack Example",
                  subTitle: "Vertical layout of views.",
                  category: .layouts,
                  closure: AnyView(StackExampleView()))        
        // Add more items here...
    ].sorted { $0.title < $1.title }
    
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
