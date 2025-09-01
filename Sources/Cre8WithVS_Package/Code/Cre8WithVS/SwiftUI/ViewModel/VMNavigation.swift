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
            await VMContainerViews(ModelNode("NavigationSplitView", "A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns.", "All"), { _ in AnyView(NavigationSplitViewDemo()) }),


        ]
        return (node,vmChildNodes)
    }
    
}
