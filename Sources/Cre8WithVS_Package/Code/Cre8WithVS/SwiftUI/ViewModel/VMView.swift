//
//  VMView.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/23/25.
//
import SwiftUI
class VMView: ViewModelNode{
    override nonisolated func createRootModelAndChildViewModels() async -> (ModelNode, [ViewModelNode]) {
        logCurrentThread()
        let node=ModelNode( "View", "SwiftUI subtitle", "platforms")
        let vmChildNodes:[ViewModelNode] = [
            await VMView(ModelNode( "Image", "Layered views", "All"),{_ in AnyView(ImageViewDemo())}),
            await VMView(ModelNode( "Button", "Layered views", "All"),{_ in AnyView(
                ButtonView()
            )}),
            await VMView(ModelNode( "Toggle", "Layered views", "All"),{_ in AnyView(ToggleViewDemo())}),
            await VMView(ModelNode( "Text", "Layered views", "All"),{_ in AnyView(TextViewDemo())})
        ]
        return (node,vmChildNodes)
    }
    
}
