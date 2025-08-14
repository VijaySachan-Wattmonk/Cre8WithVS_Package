//
//  VMViewLayout.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/23/25.
//
import SwiftUI
class VMContainerViews: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        logCurrentThread()
        let node=ModelNode( "Container views", "SwiftUI provides a range of container views that group and repeat views. Use this purely for structure and layout", "platforms")
        let vmChildNodes:[ViewModelNode] = [
            await VMContainerViews(ModelNode("HStack", "Arranges child views in a horizontal line", "All"), { _ in AnyView(HStackDemo()) }),
            await VMContainerViews(ModelNode("VStack", "Arranges child views in a vertical line", "All"), { _ in AnyView(VStackDemo()) }),
            await VMContainerViews(ModelNode("ZStack", "Overlays child views on top of each other along the z-axis", "All"), { _ in AnyView(ZStackDemo()) }),
            await VMContainerViews(ModelNode("ListView", "Displays a scrollable list of views in a single column", "All"), { _ in AnyView(ListViewDemo()) }),
            await VMContainerViews(ModelNode("NavigationLink", "Provides navigation to another view when tapped", "All"), { _ in AnyView(NavigationLinkDemo()) }),
            await VMContainerViews(ModelNode("ScrollView", "Enables scrolling through content that doesn't fit on screen", "All"), { _ in AnyView(ScrollViewDemo()) }),

        ]
        return (node,vmChildNodes)
    }
    
}
