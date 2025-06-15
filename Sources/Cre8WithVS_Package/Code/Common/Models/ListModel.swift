//
//  ListModel.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 15/06/25.
//
import Foundation
import SwiftUICore
struct ListModel:Identifiable{
    let id=UUID()
    let title: String
        let subTitle: String
        let contentView: () -> AnyView
        let category: ListCategory
        init(title: String, subTitle: String, category: ListCategory, contentView: @autoclosure @escaping () -> AnyView) {
            self.title = title
            self.subTitle = subTitle
            self.category = category
            self.contentView = contentView
        }
}
