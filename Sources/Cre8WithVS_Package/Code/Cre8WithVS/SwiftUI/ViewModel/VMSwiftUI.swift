//
//  ViewModelSwiftUI.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/19/25.
//
import SwiftUI
import SPiOSCommonP8
class VMSwiftUI: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        Global.logThreadType(tag: tag)
        let node=ModelNode( "SwiftUI", "SwiftUI subtitle", "platforms")
        let vmChildNodes:[ViewModelNode] = [
            await VMView(),
            await VMContainerViews(),
            await VMNavigation()
            /*await VMSwiftUI(ModelNode( "ZStack", "Layered views", "All"),{_ in AnyView(ZStackDemo())})*/
        ]
        return (node,vmChildNodes)
    }
    
}
