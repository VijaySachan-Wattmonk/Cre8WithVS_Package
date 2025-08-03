//
//  ViewNode.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/18/25.
//
import Foundation
import SwiftUI
struct ModelNode:Identifiable{
    let id = UUID()
    let title: String
    let subtitle: String
    let platforms: String
    //    let sectionHeader: String
    //    let sectionFooter: String
    init(_ title: String, _ subtitle: String, _ platforms: String) {
        self.title = title
        self.subtitle = subtitle
        self.platforms = platforms
    }
}
extension ModelNode {
    func matches(searchText: String) -> Bool {
        let lower = searchText.lowercased()
        return title.lowercased().contains(lower) || subtitle.lowercased().contains(lower)
    }
}



