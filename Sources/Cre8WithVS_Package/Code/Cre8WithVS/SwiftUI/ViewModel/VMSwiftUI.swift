//
//  ViewModelSwiftUI.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/19/25.
//
import SwiftUI
class VMSwiftUI: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        logCurrentThread()
        let node=ModelNode( "SwiftUI", "SwiftUI subtitle", "platforms")
        let viewModels:[ViewModelNode] = [
            await VMView(),
            await VMSwiftUI(ModelNode( "ZStack", "Layered views", "All"),{_ in AnyView(ZStackDemo())})
        ]
        return (node,viewModels)
    }
    
}
