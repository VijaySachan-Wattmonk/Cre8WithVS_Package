//
//  VMNavigation.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/23/25.
//
import SwiftUI
import SPiOSCommonP8
class VMNavigation: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        Global.logThreadType(tag: tag)
        let node = ModelNode(
            "Navigation",
            "Navigation in SwiftUI lets users move between views in a clear hierarchy, enabling smooth and dynamic flow.",
            "platforms"
        )
        let vmChildNodes:[ViewModelNode] = [
//            await VMContainerViews(ModelNode("HStack", "Arranges child views in a horizontal line", "All"), { _ in AnyView(HStackDemo()) }),


        ]
        return (node,vmChildNodes)
    }
    
}
